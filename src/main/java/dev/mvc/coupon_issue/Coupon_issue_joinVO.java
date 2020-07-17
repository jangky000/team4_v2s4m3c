package dev.mvc.coupon_issue;

import dev.mvc.coupon.CouponVO;

/** ÄíÆù ¹ßÇà + ÄíÆù */
public class Coupon_issue_joinVO {
  
  /** ÄíÆùVO */
  private CouponVO couponVO;
  /** ÄíÆù ¹ßÇà VO */
  private Coupon_issueVO coupon_issueVO;
  
  // getter setter
  public CouponVO getCouponVO() {
    return couponVO;
  }
  public void setCouponVO(CouponVO couponVO) {
    this.couponVO = couponVO;
  }
  public Coupon_issueVO getCoupon_issueVO() {
    return coupon_issueVO;
  }
  public void setCoupon_issueVO(Coupon_issueVO coupon_issueVO) {
    this.coupon_issueVO = coupon_issueVO;
  }
    
  
}
