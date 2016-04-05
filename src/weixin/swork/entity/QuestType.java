package weixin.swork.entity;

public class QuestType {

	
	private String questId;

	private String eventRegionId;

	public String getEventRegionId() {
		return eventRegionId;
	}



	public void setEventRegionId(String eventRegionId) {
		this.eventRegionId = eventRegionId;
	}



	public String getQuestId() {
		return questId;
	}



	public void setQuestId(String questId) {
		this.questId = questId;
	}



	@Override
	public String toString() {
		return "QuestType [questId=" + questId + ", eventRegionId="
				+ eventRegionId + "]";
	}



	
	
}
