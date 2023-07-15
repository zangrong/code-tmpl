/**
 * Cetian Techs Ltd., Co. 2021
 *
 * @ClassName GenerateModel
 * @Author zangrong
 */
package com.cetian.codetmpl.model;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 *@ClassName GenerateModel
 *@Author zangrong
 *@Date 2022/4/2 5:30 PM
 *@Description TODO
 */
@Data
public class GenerateModel {

    private String packageName;
    private String moduleName;
    private String entityName;
    private String entityNameCamel;
    private String controllerMapping;
    private String createDate;
    private String author;
    private String packageDescription;
    private Class keyType;
    private String keyTypeStr;

    public GenerateModel(String packageName, String moduleName, String entityName, Class keyType, String author, String packageDescription) {
        this.packageName = packageName;
        this.moduleName = moduleName;
        this.entityName = entityName;
        this.keyType = keyType;
        this.author = author;
        this.packageDescription = packageDescription;
        this.entityNameCamel = StringUtils.uncapitalize(entityName);
        if (this.keyType == String.class){
            this.keyTypeStr = "String";
        }else if(this.keyType == Integer.class){
            this.keyTypeStr = "Integer";
        }else{
            this.keyTypeStr = "Long";
        }

        String[] entityArray = StringUtils.splitByCharacterTypeCamelCase(entityName);
        List<String> entityNameList = List.of(entityArray).stream().map(StringUtils::lowerCase).collect(Collectors.toList());
        this.controllerMapping = "/" + StringUtils.join(entityNameList, '/');
        this.createDate = DateFormatUtils.ISO_8601_EXTENDED_DATETIME_FORMAT.format(new Date());
    }
}
