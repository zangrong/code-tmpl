/**
 * ${packageDescription}
 *
 * @ClassName ${entityName}Eo
 * @Author ${author}
*/
package ${packageName}.${moduleName}.entity;

import com.cetian.ctsingle.base.constant.CtConstant;
import ${packageName}.${moduleName}.support.${entityName}StateEnum;
import com.vladmihalcea.hibernate.type.json.JsonStringType;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * @ClassName ${entityName}Eo
 * @Author ${author}
 * @Date ${createDate}
 * @Description TODO
*/
@Data
@Entity
@Table(name = "ct_${entityNameCamel}")
@EntityListeners(AuditingEntityListener.class)
@TypeDefs({ @TypeDef(name = CtConstant.JSON, typeClass = JsonStringType.class) })
@ToString(of = {"id", "name", "code"})
public class ${entityName}Eo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Enumerated(EnumType.ORDINAL)
    @Column(columnDefinition = "TINYINT(1)")
    private ${entityName}StateEnum state;
    @Column(length = 200)
    private String head;// 头像
    @Column(length = 50)
    private String name;// 姓名
    @Column(length = 20)
    private String code;// 用户编号
    @Column(length = 200)
    private String remark;// 备注

    @Type( type = CtConstant.JSON )
    @Column( columnDefinition = CtConstant.JSON )
    private List<String> modules;
    @CreatedDate
    private Date createDate;
    @LastModifiedDate
    private Date updateDate;

}
