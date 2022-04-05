/**
 * Cetian Techs Ltd., Co. 2021
 *
 * @ClassName ClassTypeEnum
 * @Author zangrong
 */
package com.cetian.codetmpl.model;

import lombok.AllArgsConstructor;

/**
 *@ClassName ClassTypeEnum
 *@Author zangrong
 *@Date 2022/4/2 4:09 PM
 *@Description TODO
 */
@AllArgsConstructor
public enum GenerateTypeEnum {

    controller(0, "controller", "controller"),//
    service(1, "service", "service"),//
    dao(2, "dao", "dao"),//
    entity(3, "eo", "entity"),//
    mapper(4, "mapper", "support"),//
    pageDto(5, "pageDto", "dto"),//
    createDto(6, "createDto", "dto"),//
    updateDto(7, "updateDto", "dto"),//
    listVo(8, "listVo", "vo"),//
    detailVo(9, "detailVo", "vo"),//
    ;

    private int value;
    private String name;
    private String pn;// package name

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPn() {
        return pn;
    }

    public void setPn(String pn) {
        this.pn = pn;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

}
