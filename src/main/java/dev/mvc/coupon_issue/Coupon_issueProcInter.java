package dev.mvc.coupon_issue;

import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;

public interface Coupon_issueProcInter {
  
  /**
   * <xmp>
   *  ���� �߱� ���: �߱� ������ �Ѵ� �̳� ���
   * <insert id="create" parameterType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public int create(Coupon_issueVO coupon_issueVO);

  /**
   * <xmp>
   *  ���� �߱� ���
   * <select id="list" resultType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public List<Coupon_issueVO> list();

  /**
   * <xmp>
   *  ���� �� ��� ���� ���� ���
   * <select id="list_by_memno_join_coupon_not_used" resultMap="Coupon_issue_joinVO_Map" parameterType="int">
   * <xmp>
   * @param memno
   * @return
   */
  public List<Coupon_issue_joinVO> list_by_memno_join_coupon_not_used(int memno);
  
  /**
   * <xmp>
   *  ���� �߱� ��ȸ
   * <select id="read" resultType="Coupon_issueVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Coupon_issueVO read(int coupon_issueno);

  /**
   * <xmp>
   *  ���� ���� ���� ���� -- I: issue �߱�, U: used ���Ϸ�, C:calceled �߱����
   * <update id="update_status" parameterType="HashMap">
   * <xmp>
   * @param map
   * @return 
   */
  public int update_list_status(HashMap map);

  /**
   * <xmp>
   *  ���� �߱� ����: ���� ��� ����, ���� ����  -- I: issue �߱�, U: used ���Ϸ�
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int coupon_issueno);
  
  /**
   * ���� ���� ��� ��
   * @return
   */
  public int search_count();
  
  /**
   * ����¡ �ڽ�
   * @param listFile
   * @param search_count
   * @param nowPage
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage);
  
  /**
   * ���� ���� ����¡ ���
   * @param map
   * @return
   */
  public List<CouponVO> list_by_coupon_issueno_paging(HashMap<String, Object> map);
}
