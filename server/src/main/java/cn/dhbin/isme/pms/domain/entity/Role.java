package cn.dhbin.isme.pms.domain.entity;

import cn.dhbin.mapstruct.helper.core.Convert;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 角色
 *
 * @author dhb
 */
@Data
@TableName("role")
@KeySequence(value = "role_id_seq")
public class Role implements Convert {

    @TableId(type = IdType.INPUT)
    private Long id;

    private String code;

    private String name;

    private Boolean enable;

}
