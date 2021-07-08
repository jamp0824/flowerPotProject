package com.flowerPot.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria { // pageNum 과 amount 값을 같이 전달하는 용도,,, 

  private int pageNum;
  private int amount;
  private String category; 
  private int n_category; 
  private String categoryName; 
  private String SearchName;
 

  public Criteria() {
    this(1, 5);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
 
}
