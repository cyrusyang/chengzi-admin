package cn.dhbin.isme.pms.domain.entity;

import cn.dhbin.mapstruct.helper.core.Convert;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

/**
 * 用户信息
 *
 * @author dhb
 */
@Data
@TableName("profile")
@KeySequence(value = "profile_id_seq")
public class Profile implements Convert {

    @TableId(type = IdType.INPUT)
    private Long id;

    private Integer gender;

    private String avatar;

    private String address;

    private String email;

    @TableField("user_id")
    private Long userId;

    @TableField("nick_name")
    private String nickName;

}
