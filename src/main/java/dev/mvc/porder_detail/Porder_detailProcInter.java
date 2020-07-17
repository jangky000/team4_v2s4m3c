package dev.mvc.porder_detail;

import java.util.HashMap;
import java.util.List;

public interface Porder_detailProcInter {
  
  /**
   * <xmp>
   * 주문 내역 등록
   * <insert id="create" parameterType="Porder_detailVO">
   * <xmp>
   * @return
   */
  public int create(Porder_detailVO porder_detailVO);

  /**
   * <xmp>
   * 주문 내역 목록
   * <select id="list" resultType="Porder_detailVO">
   * <xmp>
   * @return
   */
  public List<Porder_detailVO> list();

  /**
   * <xmp>
   *  주문no별 주문 상세 내역 리스트
   * <select id="list_by_porderno" resultType="Porder_detailVO" parameterType="int">
   * <xmp>
   * @return
   */
  public List<Porder_detailVO> list_by_porderno(int porderno);
  
  /**
   * <xmp>
   * 주문 상세 수정: 운송장등록
   * <update id="update_trackingno" parameterType="HashMap ">
   * <xmp>
   * @return
   */
  public int update_trackingno(HashMap map);
}
