package com.cjcs.bnb.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.cjcs.bnb.dto.ExtendedNotifBoardDto;

@Mapper
public interface NotificationMapper {
    List<ExtendedNotifBoardDto> getNotifications(String userId);

    void markAllAsRead(@Param("userId") String userId);
}
