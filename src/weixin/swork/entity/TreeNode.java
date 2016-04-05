package weixin.swork.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lee on 2016/3/10.
 */
public class TreeNode {
    @JSONField(name = "nodes")
    List<TreeNode> subNodes;
    String text;
    String id;

    public TreeNode(String text, String id) {
        this.text = text;
        this.id = id;
    }

    public List<TreeNode> getSubNodes() {
        return subNodes;
    }

    public void setSubNodes(List<TreeNode> subNodes) {
        this.subNodes = subNodes;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
