package dev.mvc.porder_detail;

import java.util.HashMap;
import java.util.List;

public interface Porder_detailProcInter {
  
  /**
   * <xmp>
   * �ֹ� ���� ���
   * <insert id="create" parameterType="Porder_detailVO">
   * <xmp>
   * @return
   */
  public int create(Porder_detailVO porder_detailVO);

  /**
   * <xmp>
   * �ֹ� ���� ���
   * <select id="list" resultType="Porder_detailVO">
   * <xmp>
   * @return
   */
  public List<Porder_detailVO> list();

  /**
   * <xmp>
   *  �ֹ�no�� �ֹ� �� ���� ����Ʈ
   * <select id="list_by_porderno" resultType="Porder_detailVO" parameterType="int">
   * <xmp>
   * @return
   */
  public List<Porder_detailVO> list_by_porderno(int porderno);
  
  /**
   * <xmp>
   * �ֹ� �� ����: �������
   * <update id="update_trackingno" parameterType="HashMap ">
   * <xmp>
   * @return
   */
  public int update_trackingno(HashMap map);
}
