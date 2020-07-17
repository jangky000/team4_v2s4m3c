package dev.mvc.coupon_use;

import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;

public interface Coupon_useProcInter {
  /**
   * <xmp>
   *  쿠폰 사용 등록
   * <insert id="create" parameterType="Coupon_useVO">
   * <xmp>
   * @return
   */
  public int create(int porderno, int coupon_issueno, String cpstatus);

  /**
   * <xmp>
   *  쿠폰 사용 목록
   * <select id="list" resultType="Coupon_useVO">
   * <xmp>
   * @return
   */
  public List<Coupon_useVO> list();

  /**
   * <xmp>
   *  쿠폰 사용 조회
   * <select id="read" resultType="Coupon_useVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Coupon_useVO read(int coupon_useno);

  /**
   * 수정
   */

  /**
   * <xmp>
   *  쿠폰 사용 삭제: 삭제 사용 안함, 상태변경 -- 사용:U, 취소:C
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int coupon_useno);
  
  /**
   * 쿠폰 사용 목록 수
   * @param hashMap
   * @return
   */
  public int search_count();
  
  /**
   * 페이징 박스
   * @param listFile
   * @param search_count
   * @param nowPage
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage);
  
  /**
   * 쿠폰 사용 페이징 목록
   * @param map
   * @return
   */
  public List<CouponVO> list_by_coupon_useno_paging(HashMap<String, Object> map);
}
