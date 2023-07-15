/**
 * ${packageDescription}
 *
 * @ClassName ${entityName}Controller
 * @Author ${author}
*/
package ${packageName}.${moduleName}.controller;

import com.cetian.ctsingle.base.model.ApiResponse;
import com.cetian.ctsingle.base.model.PageInfo;
import ${packageName}.${moduleName}.dto.${entityName}CreateDto;
import ${packageName}.${moduleName}.dto.${entityName}PageDto;
import ${packageName}.${moduleName}.dto.${entityName}UpdateDto;
import ${packageName}.${moduleName}.service.${entityName}Service;
import ${packageName}.${moduleName}.vo.${entityName}ListVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @ClassName ${entityName}Controller
 * @Author ${author}
 * @Date ${createDate}
 * @Description TODO
*/
@Slf4j
@RestController
@RequestMapping("${controllerMapping}")
public class ${entityName}Controller {

    @Autowired
    private ${entityName}Service ${entityNameCamel}Service;

    @PostMapping("/page")
    public ApiResponse<PageInfo<${entityName}ListVo>> page(@RequestBody ${entityName}PageDto dto){
    return ${entityNameCamel}Service.page(dto);
    }

    @GetMapping("/detail")
    public ApiResponse<${entityName}DetailVo> detail(@RequestParam ${keyTypeStr} id){
        return ${entityNameCamel}Service.detail(id);
    }

    @PostMapping("/create")
    public ApiResponse create(@RequestBody ${entityName}CreateDto dto){
        return ${entityNameCamel}Service.create(dto);
    }

    @PostMapping("/update")
    public ApiResponse update(@RequestBody ${entityName}UpdateDto dto){
        return ${entityNameCamel}Service.update(dto);
    }

    @DeleteMapping("/delete")
    public ApiResponse delete(@RequestParam ${keyTypeStr} id){
        return ${entityNameCamel}Service.delete(id);
    }

    @DeleteMapping("/delete/all")
    public ApiResponse deleteAll(@RequestBody List<${keyTypeStr}> ids){
        return ${entityNameCamel}Service.deleteAll(ids);
    }


}
