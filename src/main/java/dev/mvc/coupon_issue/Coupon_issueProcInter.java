package dev.mvc.coupon_issue;

import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;

public interface Coupon_issueProcInter {
  
  /**
   * <xmp>
   *  쿠폰 발급 등록: 발급 기준일 한달 이내 사용
   * <insert id="create" parameterType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public int create(Coupon_issueVO coupon_issueVO);

  /**
   * <xmp>
   *  쿠폰 발급 목록
   * <select id="list" resultType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public List<Coupon_issueVO> list();

  /**
   * <xmp>
   *  결제 시 사용 가능 쿠폰 목록
   * <select id="list_by_memno_join_coupon_not_used" resultMap="Coupon_issue_joinVO_Map" parameterType="int">
   * <xmp>
   * @param memno
   * @return
   */
  public List<Coupon_issue_joinVO> list_by_memno_join_coupon_not_used(int memno);
  
  /**
   * <xmp>
   *  쿠폰 발급 조회
   * <select id="read" resultType="Coupon_issueVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Coupon_issueVO read(int coupon_issueno);

  /**
   * <xmp>
   *  쿠폰 발행 상태 변경 -- I: issue 발급, U: used 사용완료, C:calceled 발급취소
   * <update id="update_status" parameterType="HashMap">
   * <xmp>
   * @param map
   * @return 
   */
  public int update_list_status(HashMap map);

  /**
   * <xmp>
   *  쿠폰 발급 삭제: 삭제 사용 안함, 상태 변경  -- I: issue 발급, U: used 사용완료
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int coupon_issueno);
  
  /**
   * 쿠폰 발행 목록 수
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
   * 쿠폰 발행 페이징 목록
   * @param map
   * @return
   */
  public List<CouponVO> list_by_coupon_issueno_paging(HashMap<String, Object> map);
}
