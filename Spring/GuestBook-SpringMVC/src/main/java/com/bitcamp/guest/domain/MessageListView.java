package com.bitcamp.guest.domain;

import java.util.List;

public class MessageListView {

		private int messageTotalCount;
		private int currentPageNumber;
		private List<Message> messageList;
		private int pageTotalCount;
		private int messageCountPerPage;
		private int firstRow;
		private int endRow;
		
		public MessageListView(int messageTotalCount, int currentPageNumber, List<Message> messageList,
				int messageCountPerPage, int firstRow, int endRow) {
			
			this.messageTotalCount = messageTotalCount;
			this.currentPageNumber = currentPageNumber;
			this.messageList = messageList;
			this.messageCountPerPage = messageCountPerPage;
			this.firstRow = firstRow;
			this.endRow = endRow;
			
			calculatePageTotalCount();
		}

		private void calculatePageTotalCount() {
			
			if(messageTotalCount == 0) {
				pageTotalCount = 0;
			} else {
				pageTotalCount = messageTotalCount / messageCountPerPage; // (= 7/3)
				
				if(messageTotalCount % messageCountPerPage > 0) { // (=7%3)
					pageTotalCount ++;
				}
			}
			
		}
		
		public int getMessageTotalCount() {
			return messageTotalCount;
		}

		public void setMessageTotalCount(int messageTotalCount) {
			this.messageTotalCount = messageTotalCount;
		}

		public int getCurrentPageNumber() {
			return currentPageNumber;
		}

		public void setCurrentPageNumber(int currentPageNumber) {
			this.currentPageNumber = currentPageNumber;
		}

		public List<Message> getMessageList() {
			return messageList;
		}

		public void setMessageList(List<Message> messageList) {
			this.messageList = messageList;
		}

		public int getPageTotalCount() {
			return pageTotalCount;
		}

		public void setPageTotalCount(int pageTotalCount) {
			this.pageTotalCount = pageTotalCount;
		}

		public int getMessageCountPerPage() {
			return messageCountPerPage;
		}

		public void setMessageCountPerPage(int messageCountPerPage) {
			this.messageCountPerPage = messageCountPerPage;
		}

		public int getFirstRow() {
			return firstRow;
		}

		public void setFirstRow(int firstRow) {
			this.firstRow = firstRow;
		}

		public int getEndRow() {
			return endRow;
		}

		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}

		public boolean isEmpty() {
			return messageCountPerPage == 0;
		}
}
