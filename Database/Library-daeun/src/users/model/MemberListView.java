package users.model;

import java.util.List;

public class MemberListView {
	private int messageTotalCnt;
	private int currentPgNum;
	private int pgTotalCnt;
	private int messageCntPerPg;
	private int firstRow;
	private int endRow;
	private List<MemberInfo> memberList;
}
