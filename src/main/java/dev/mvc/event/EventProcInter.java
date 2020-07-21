package dev.mvc.event;

import java.util.HashMap;
import java.util.List;



public interface EventProcInter {
  /**
   * ���
   * <xmp>
   *   <insert id="create" parameterType="EventVO">
   * </xmp>
   * @param eventVO
   * @return
   */
  public int create(EventVO eventVO);
  
  /**
   * ��� 
   * <xmp>
   * <select id="list" resultType="EventVO">
   * </xmp>
   * @return
   */
  public List<EventVO> list();
  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param eventno ī�װ���ȣ
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @return
   */
  public String pagingBox(String listFile,int eventno, int search_count,int nowPage);
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list" resultType="EventVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<EventVO> list_paging(HashMap<String, Object> map);
  
  /**
   * <xmp>
   *  <select id="read" resultType="EventVO" parameterType="int">
   * </xmp>
   * @param eventno
   * @return
   */
  public EventVO read(int eventno);

  
  /**
   * ���� ó��
   * @param eventVO
   * @return
   */
  public int update(EventVO eventVO);
  
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * ����
   * @param eventno
   * @return
   */
  public int delete(int eventno);
  
  /**
   * <xmp>
   *   �̹��� ���, ����, ����
      <update id="jpg" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int jpg(HashMap<Object, Object> hashMap);
  
  
}
