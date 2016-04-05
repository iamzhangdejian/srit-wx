package weixin.swork.entity;

public class QuestFormInfo {
    
	
	private String questType;//问题类型
	
	private String eventRegionId;//事发区域
	
	private String questDesc;//问题描述
	
	private String spaceDesc;//位置描述
	
	private String questLevel;//问题等级
	
	private String pid;//图片ID

	public String getQuestType() {
		return questType;
	}

	public void setQuestType(String questType) {
		this.questType = questType;
	}

	public String getEventRegionId() {
		return eventRegionId;
	}

	public void setEventRegionId(String eventRegionId) {
		this.eventRegionId = eventRegionId;
	}

	public String getQuestDesc() {
		return questDesc;
	}

	public void setQuestDesc(String questDesc) {
		this.questDesc = questDesc;
	}

	public String getSpaceDesc() {
		return spaceDesc;
	}

	public void setSpaceDesc(String spaceDesc) {
		this.spaceDesc = spaceDesc;
	}

	public String getQuestLevel() {
		return questLevel;
	}

	public void setQuestLevel(String questLevel) {
		this.questLevel = questLevel;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "QuestFormInfo [questType=" + questType + ", eventRegionId="
				+ eventRegionId + ", questDesc=" + questDesc + ", spaceDesc="
				+ spaceDesc + ", questLevel=" + questLevel + ", pid=" + pid
				+ "]";
	}

	

	
}
