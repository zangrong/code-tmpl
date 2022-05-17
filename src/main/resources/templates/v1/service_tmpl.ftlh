/**
 * ${packageDescription}
 *
 * @ClassName ${entityName}Service
 * @Author ${author}
*/
package ${packageName}.${moduleName}.controller;

import com.cetian.ctsingle.base.exception.NotFoundException;
import com.cetian.ctsingle.base.model.ApiResponse;
import com.cetian.ctsingle.base.model.PageInfo;
import ${packageName}.${moduleName}.dao.${entityName}Dao;
import ${packageName}.${moduleName}.dto.${entityName}CreateDto;
import ${packageName}.${moduleName}.dto.${entityName}PageDto;
import ${packageName}.${moduleName}.dto.${entityName}UpdateDto;
import ${packageName}.${moduleName}.entity.${entityName}Eo;
import ${packageName}.${moduleName}.support.${entityName}Mapper;
import ${packageName}.${moduleName}.vo.${entityName}ListVo;
import com.cetian.util.JpaUtil;
import com.cetian.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Predicate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @ClassName ${entityName}Service
 * @Author ${author}
 * @Date ${createDate}
 * @Description TODO
*/
@Slf4j
@Service
public class ${entityName}Service {

    @Autowired
    private ${entityName}Dao ${entityNameCamel}Dao;

    public ApiResponse update(${entityName}UpdateDto dto) {
        ${entityName}Eo ${entityNameCamel} = ${entityNameCamel}Dao.findById(dto.getId()).orElseThrow(()->new NotFoundException("未找到"));
        ${entityNameCamel}Dao.save(${entityNameCamel});
        return ApiResponse.success();
    }

    public ApiResponse<PageInfo<${entityName}ListVo>> page(${entityName}PageDto dto) {
        Page<${entityName}Eo> page = ${entityNameCamel}Dao.findAll((Specification<${entityName}Eo>) (root, query, cb) -> {
            List<Predicate> list = new ArrayList<>();
            if (StringUtils.isNotBlank(dto.getText())) {
                List<Predicate> orList = new ArrayList<>();
                JpaUtil.like(StringUtil.embraceLike(dto.getText()), "name", orList, root, cb);
                list.add(cb.or(orList.stream().toArray(Predicate[]::new)));
            }
            return JpaUtil.listToPredicate(list, cb, true);
        }, dto.getPageRequest());
        List<${entityName}ListVo> voList = page.getContent().stream().map(v -> ${entityName}Mapper.INSTANCE.eoToListVo(v)).collect(Collectors.toList());
        return ApiResponse.success().withData(PageInfo.of(voList, page.getTotalElements()));
    }

    public ApiResponse<${entityName}DetailVo> detail(int id) {
        ${entityName}Eo ${entityNameCamel}Eo = ${entityNameCamel}Dao.findById(id).orElseThrow(()->new NotFoundException("未找到"));
        ${entityName}DetailVo ${entityNameCamel}DetailVo = ${entityName}Mapper.INSTANCE.eoToDetailVo(${entityNameCamel}Eo);
        return ApiResponse.success().withData(${entityNameCamel}DetailVo);
    }

    public ApiResponse create(${entityName}CreateDto dto) {
        // TODO pre check
        ${entityName}Eo ${entityNameCamel} = ${entityName}Mapper.INSTANCE.createDtoToEo(dto);
        ${entityNameCamel}Dao.save(${entityNameCamel});
        return ApiResponse.success();
    }

    public ApiResponse delete(int id) {
        log.warn("delete=[{}]", id);
        ${entityNameCamel}Dao.deleteById(id);
        return ApiResponse.success();
    }

    public ApiResponse deleteAll(List<Integer> ids) {
        log.warn("deleteAll=[{}]", ids);
        ${entityNameCamel}Dao.deleteAllById(ids);
        return ApiResponse.success();
    }

}
