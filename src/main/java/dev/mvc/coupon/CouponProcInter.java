package dev.mvc.coupon;

import java.util.HashMap;
import java.util.List;

public interface CouponProcInter {
  
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
   * 쿠폰 전체 레코드 개수
   * @param hashMap
   * @return
   */
  public int search_count();
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @return 페이징 생성 문자열
   */ 
  public String pagingBox(String listFile, int search_count, int nowPage);
  
  /**
   * 쿠폰 번호별 페이징
   * @param map
   * @return
   */
  public List<CouponVO> list_by_couponno_paging(HashMap<String, Object> map);
  
}
