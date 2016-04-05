package weixin.swork.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.jeecgframework.core.util.PropertiesUtil;
import weixin.swork.entity.TreeNode;

import java.util.*;

/**
 * Created by lee on 2016/3/9.
 */
public class JsonHelper {
    public static HashMap<String, String> translateKeys(HashMap<String, String> map, String propertiesFile){
        PropertiesUtil properties = new PropertiesUtil(propertiesFile);
        HashMap<String, String> result = new HashMap<>();
        for(String key:map.keySet()){
            String realKey = properties.readProperty(key);
            result.put(realKey, map.get(key));
        }
        return result;
    }

    public static String getTreeNodeString(String rawString) {
        String result="";
        //得到json对象
        JSONArray array = JSON.parseArray(rawString);
        List<JSONObject> level;
        List<List<JSONObject>> treeList = new ArrayList<>();
        for(int i=0;i<6;i++){
            level = new ArrayList<>();
            treeList.add(level);
        }
        List<TreeNode> subNodes;
        List<TreeNode> root = new ArrayList<>();
        HashMap<String, List<TreeNode>> levelMap = new HashMap<>();

        JSONObject object;
        for(int i=0;i<array.size();i++){
            object = array.getJSONObject(i);
            int tlevel = Integer.parseInt(object.getString("TREE_LEVEL"));
            //out of bound
            if(treeList.size()<=tlevel){
                List<List<JSONObject>> tmpList = new ArrayList<>();
                for(int j=0;i<3;i++){
                    level = new ArrayList<>();
                    treeList.add(level);
                }
                tmpList.addAll(treeList);
                treeList = tmpList;
            }
            //get list of tree level
            level = treeList.get(tlevel);
            if (level==null) {
                level = new ArrayList<>();
                treeList.add(tlevel, level);
            }

            level.add(object);
        }

        TreeNode node;
        for (int i=treeList.size()-1;i>0;i--){
            level = treeList.get(i);
            if(level==null) continue;
            for(JSONObject obj:level){
                //build a new node
                String text = obj.getString("CASE_TYPE_NAME");
                String pid = obj.getString("PARENT_CASE_TYPE_ID");
                String id = obj.getString("CASE_TYPE_ID");
                node = new TreeNode(text, id);
                if (i==1) root.add(node);
                //subnodes
                subNodes = levelMap.get(id);
                if (subNodes!=null) {
                    node.setSubNodes(subNodes);
                    levelMap.remove(id);
                }

                //parent nodes
                subNodes = levelMap.get(pid);
                if (subNodes==null) {
                    subNodes = new ArrayList<>();
                    subNodes.add(node);
                    levelMap.put(pid, subNodes);
                } else{
                    subNodes.add(node);
                }
            }
        }

        return JSON.toJSONString(root);
    }
    public static void main(String args[]) {
        //test
        HashMap<String, String> testcase = new HashMap<>();
        testcase.put("case_type_id","1");
        testcase.put("case_desc","2");
        testcase.put("case_pos_desc","3");
        testcase.put("case_effect_desc","4");
        testcase = translateKeys(testcase, "callservice.properties");
        System.out.print(testcase.toString());
    }
}
