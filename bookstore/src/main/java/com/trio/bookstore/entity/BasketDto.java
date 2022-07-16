package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BasketDto {
  private int basketNo;
  private String basketMemberId;
  private int basketUsedNo;
  private int basketBookNo;
  private int basketAmount;
  private int basketPrice;
  private String basketBookTitle;
  private String basketBookImage;
}
