package dev.mvc.reply;

public class ReplyVO {
  /** ��� ��ȣ */
  private int replyno;
  /** ���� �� ��ȣ */
  private int eventno;
  /** ȸ�� ��ȣ */
  private int memno;
  /** ���� */
  private String content;
  /** �н����� */
  private String passwd;
  /** ����� */
  private String rdate;
  
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
  }

  public int getEventno() {
    return eventno;
  }
  public void setEventno(int eventno) {
    this.eventno = eventno;
  }
  public int getMemno() {
    return memno;
  }
  public void setMemno(int memno) {
    this.memno = memno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}

 