/**
 * Cetian Techs Ltd., Co. 2021
 *
 * @ClassName CodeTmplApplication
 * @Author zangrong
 */
package com.cetian.codetmpl;

import com.cetian.codetmpl.model.GenerateModel;
import com.cetian.codetmpl.model.GenerateTypeEnum;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.EnumUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.List;

/**
 *@ClassName CodeTmplApplication
 *@Author zangrong
 *@Date 2022/4/2 9:47 AM
 *@Description TODO
 */
@Slf4j
public class CodeTmplApplication {

    public static void main(String[] args) throws Exception{

        /* ------------------------------------------------------------------------ */
        /* You should do this ONLY ONCE in the whole application life-cycle:        */

        /* Create and adjust the configuration singleton */
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_29);
        cfg.setDirectoryForTemplateLoading(new File("./src/main/resources/templates/v1"));
        // Recommended settings for new projects:
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        cfg.setLogTemplateExceptions(false);
        cfg.setWrapUncheckedExceptions(true);
        cfg.setFallbackOnNullLoopVariable(false);

        /* ------------------------------------------------------------------------ */
        /* You usually do these for MULTIPLE TIMES in the application life-cycle:   */

        /* Create a data-model */
        GenerateModel model = new GenerateModel("com.cetian.ctsingle.module", "lnjn.dstrb",
                "Dstrb", String.class, "zangrong", "Cetian Techs Ltd., Co. 2023");

        generate(model, cfg);

    }

    private static void generate(GenerateModel model, Configuration cfg) throws Exception{

        String generateDatetime = DateFormatUtils.format(new Date(), "yyyyMMdd-HHmmss");
        // 多层package目录
        String moduleName = StringUtils.lowerCase(StringUtils.replaceAll(model.getModuleName(), "\\.", "/"));
        String outDir = String.format("./codeout/%s/%s", generateDatetime, moduleName);
//        FileUtils.forceDelete(new File(outDir));
        FileUtils.forceMkdir(new File(outDir));

        List<GenerateTypeEnum> enumList = EnumUtils.getEnumList(GenerateTypeEnum.class);
        enumList.forEach(v-> {
            try {
                generateFile(v, outDir, model, cfg);
            } catch (Exception e) {
                log.warn("[{}] 生成异常", v);
                log.warn("", e);
            }
        });

    }

    private static void generateFile(GenerateTypeEnum generateType, String outDir, GenerateModel model, Configuration cfg) throws Exception{
        Template temp = cfg.getTemplate(String.format("%s_tmpl.ftlh", generateType.getName()));
        String dir = outDir + "/" + generateType.getPn();
        File fileDir = new File(dir);
        if (!fileDir.exists()){
            FileUtils.forceMkdir(fileDir);
        }
        String className = model.getEntityName() + StringUtils.capitalize(generateType.getName());
        String filePath = String.format("%s/%s.java", dir, className);
        FileWriter fileWriter = new FileWriter(filePath, Charset.forName("utf-8"), false);
        temp.process(model, fileWriter);
    }

}
