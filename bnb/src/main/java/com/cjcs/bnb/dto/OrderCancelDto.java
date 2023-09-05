package com.cjcs.bnb.dto;

import org.apache.ibatis.javassist.compiler.ast.Member;

import lombok.Data;

@Data
public class OrderCancelDto {
    MemberDto memberdto = getMemberId();

    private MemberDto getMemberId() {
        return null;
        
    }

}
