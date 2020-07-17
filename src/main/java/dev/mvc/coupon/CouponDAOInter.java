package dev.mvc.coupon;

import java.util.HashMap;
import java.util.List;

public interface CouponDAOInter {
  
  /**
   * <xmp>
   *  쿠폰 등록
   * <insert id="create" parameterType="CouponVO">
   * <xmp>
   * @return
   */
  public int create(CouponVO couponVO);

  /**
   * <xmp>
   *  쿠폰 목록
   * <select id="list" resultType="CouponVO">
   * <xmp>
   * @return
   */
  public List<CouponVO> list();

  /**
   * <xmp>
   *  쿠폰 조회
   * <select id="read" resultType="CouponVO" parameterType="int">
   * <xmp>
   * @return
   */
  public CouponVO read(int couponno);

  /**
   * 수정
   */

  /**
   * <xmp>
   *  쿠폰 삭제: 삭제 안함 -> 재고가 0이면 발급 불가
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int couponno);

  /**
   * 쿠폰 총 개수
   * @param hashMap
   * @return
   */
  public int search_count();
  
  /**
   * 쿠폰 페이징 목록
   * @param map
   * @return
   */
  public List<CouponVO> list_by_couponno_paging(HashMap<String, Object> map);
}
