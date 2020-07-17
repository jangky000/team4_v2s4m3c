package dev.mvc.porder;

import java.util.List;

public interface PorderProcInter {
  
  /**
   * <xmp>
   * 주문 등록
   * <insert id="create" parameterType="PorderVO">
   * <xmp>
   * @return
   */
  public int create(PorderVO porderVO);
  
  /**
   * <xmp>
   * 주문 목록
   * <select id="list" resultType="PorderVO">
   * <xmp>
   * @return
   */
  public List<PorderVO> list();

  /**
   * <xmp>
   * 내 주문 목록: porder + detail + item
   * <select id="list_join_porder_detail_item" resultType="Porder_detail_itemVO_Map">
   * <xmp>
   * @param memno
   * @return
   */
  public List<Porder_detail_itemVO> list_join_porder_detail_item(int memno);
  
  /**
   * <xmp>
   * 주문 조회
   * <select id="read" resultType="PorderVO" parameterType="int">
   * <xmp>
   * @return
   */
  public PorderVO read(int porderno);

  /**
   * <xmp>
   * 주문 수정
   * <update id="update" parameterType="PorderVO">
   * <xmp>
   * @return
   */
  public int update(PorderVO porderVO);

  /**
   * <xmp>
   * 주문 삭제
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int porderno);
}
