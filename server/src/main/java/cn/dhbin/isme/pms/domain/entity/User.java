package cn.dhbin.isme.pms.domain.entity;

import cn.dhbin.mapstruct.helper.core.Convert;
import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
import lombok.Data;

/**
 * 用户
 *
 * @author dhb
 */
@Data
@TableName("\"user\"")
@KeySequence(value = "user_id_seq")
public class User implements Convert {

    @TableId(type = IdType.INPUT)
    private Long id;

    private String username;

    private String password;

    private Boolean enable;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;

}
