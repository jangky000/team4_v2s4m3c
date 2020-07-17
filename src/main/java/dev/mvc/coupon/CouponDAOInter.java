package dev.mvc.coupon;

import java.util.HashMap;
import java.util.List;

public interface CouponDAOInter {
  
  /**
   * <xmp>
   *  ���� ���
   * <insert id="create" parameterType="CouponVO">
   * <xmp>
   * @return
   */
  public int create(CouponVO couponVO);

  /**
   * <xmp>
   *  ���� ���
   * <select id="list" resultType="CouponVO">
   * <xmp>
   * @return
   */
  public List<CouponVO> list();

  /**
   * <xmp>
   *  ���� ��ȸ
   * <select id="read" resultType="CouponVO" parameterType="int">
   * <xmp>
   * @return
   */
  public CouponVO read(int couponno);

  /**
   * ����
   */

  /**
   * <xmp>
   *  ���� ����: ���� ���� -> ��� 0�̸� �߱� �Ұ�
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int couponno);

  /**
   * ���� �� ����
   * @param hashMap
   * @return
   */
  public int search_count();
  
  /**
   * ���� ����¡ ���
   * @param map
   * @return
   */
  public List<CouponVO> list_by_couponno_paging(HashMap<String, Object> map);
}
