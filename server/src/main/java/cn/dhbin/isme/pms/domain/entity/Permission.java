package cn.dhbin.isme.pms.domain.entity;

import cn.dhbin.mapstruct.helper.core.Convert;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

/**
 * 权限
 *
 * @author dhb
 */
@Data
@TableName("permission")
@KeySequence(value = "permission_id_seq")
public class Permission implements Convert {

    @TableId(type = IdType.INPUT)
    private Long id;

    private String name;

    private String code;

    private String type;

    @TableField("parent_id")
    private Long parentId;

    private String path;

    private String redirect;

    private String icon;

    private String component;

    private String layout;

    @TableField("keep_alive")
    private Boolean keepAlive;

    private String method;

    private String description;

    @TableField("show")
    private Boolean show;

    private Boolean enable;
    @TableField("\"order\"")
    private Integer order;

}
