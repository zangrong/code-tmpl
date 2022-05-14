/**
 * ${packageDescription}
 *
 * @ClassName ${entityName}Mapper
 * @Author ${author}
*/
package ${packageName}.${moduleName}.support;

import ${packageName}.${moduleName}.dto.${entityName}CreateDto;
import ${packageName}.${moduleName}.entity.${entityName}Eo;
import ${packageName}.${moduleName}.vo.${entityName}ListVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @ClassName ${entityName}Mapper
 * @Author ${author}
 * @Date ${createDate}
 * @Description TODO
*/
@Mapper
public interface ${entityName}Mapper {

    ${entityName}Mapper INSTANCE = Mappers.getMapper(${entityName}Mapper.class);

    ${entityName}ListVo eoToListVo(${entityName}Eo eo);

    ${entityName}DetailVo eoToDetailVo(${entityName}Eo eo);

    ${entityName}Eo createDtoToEo(${entityName}CreateDto dto);
}
