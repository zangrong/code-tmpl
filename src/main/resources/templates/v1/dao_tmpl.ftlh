/**
 * ${packageDescription}
 *
 * @ClassName UserController
 * @Author ${author}
*/
package ${packageName}.${moduleName}.dao;

import ${packageName}.${moduleName}.entity.${entityName}Eo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;

/**
 * @ClassName ${entityName}Service
 * @author ${author}
 * @date ${createDate}
 * @Description
*/
public interface ${entityName}Dao extends JpaRepository<${entityName}Eo, Integer>, JpaSpecificationExecutor<${entityName}Eo> {

}
