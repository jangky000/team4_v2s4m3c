package dev.mvc.porder;

import java.util.List;

public interface PorderProcInter {
  
  /**
   * <xmp>
   * �ֹ� ���
   * <insert id="create" parameterType="PorderVO">
   * <xmp>
   * @return
   */
  public int create(PorderVO porderVO);
  
  /**
   * <xmp>
   * �ֹ� ���
   * <select id="list" resultType="PorderVO">
   * <xmp>
   * @return
   */
  public List<PorderVO> list();

  /**
   * <xmp>
   * �� �ֹ� ���: porder + detail + item
   * <select id="list_join_porder_detail_item" resultType="Porder_detail_itemVO_Map">
   * <xmp>
   * @param memno
   * @return
   */
  public List<Porder_detail_itemVO> list_join_porder_detail_item(int memno);
  
  /**
   * <xmp>
   * �ֹ� ��ȸ
   * <select id="read" resultType="PorderVO" parameterType="int">
   * <xmp>
   * @return
   */
  public PorderVO read(int porderno);

  /**
   * <xmp>
   * �ֹ� ����
   * <update id="update" parameterType="PorderVO">
   * <xmp>
   * @return
   */
  public int update(PorderVO porderVO);

  /**
   * <xmp>
   * �ֹ� ����
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int porderno);
}
