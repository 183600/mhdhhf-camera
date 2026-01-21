import "tupianchuli"
pictureCallback = Camera.PictureCallback
{
  onPictureTaken=function(data,camera)
    --Toast.makeText(activity, "正在保存……", Toast.LENGTH_LONG).show();
    print("开始保存")
    if (数据列表0.是否启用水印) then
      路径="/sdcard/Android/data/"..activity.getPackageName().."/ImageList/"
     else
      路径=nil
    end
    task(save,data,数据列表0,路径,nil,function(file)
      --Toast.makeText(activity, "图片保存完毕，"..tostring(file), Toast.LENGTH_LONG).show();
      if (数据列表0.是否启用水印) then
        水印处理()
       else
        print("保存成功")
        import "java.io.File"

        catalog=File(数据列表0.保存位置)
        name=".jpg"
        find(catalog,name,iD)
      end
    end)
    mCamera.startPreview();
  end,

}

autoFocus=Camera.AutoFocusCallback{
  onAutoFocus=function(success, camera)
    --success为true表示对焦成功
    if (success) then
      if (camera ~= nil) then
        --停止预览
        --camera.stopPreview();
        -- 拍照
        camera.takePicture(nil, nil, pictureCallback);
      end
    end
  end
}

function 获取AutoFocusCallback(事件,路径)
  pictureCallback2 = Camera.PictureCallback
  {
    onPictureTaken=function(data, camera)
      --Toast.makeText(activity, "正在保存……", Toast.LENGTH_LONG).show();
      task(save,data,数据列表0,路径 or 数据列表0.保存位置,nil,事件)
      mCamera.startPreview();
    end
  }

  --tv.background=shape_1()

  autoFocus3=Camera.AutoFocusCallback{
    onAutoFocus=function(success, camera)
      --success为true表示对焦成功
      if (success) then
        if (camera ~= nil) then
          --停止预览
          --camera.stopPreview();
          -- 拍照
          camera.takePicture(nil, nil, pictureCallback2)
        end
      end
    end
  }
  return autoFocus3
end

伪长曝光pictureCallback = Camera.PictureCallback
{
  onPictureTaken=function(data,camera)
    --Toast.makeText(activity, "正在保存……", Toast.LENGTH_LONG).show();
    if (伪长曝光状态=="打开") then
      task(save,data,数据列表0,"/sdcard/Android/data/"..activity.getPackageName().."/ImageList/",85,function(file)
        次数=次数+1
        拍照按钮显示文本.text=tostring(次数);
        -- 拍照
        mCamera.takePicture(nil, nil, 伪长曝光pictureCallback)
      end)
     else
      print("正在处理");
      拍照按钮显示文本.text="";
      --设置拍照时的图片大小
      parameters.setPictureSize(数据列表0.图像分辨率width,数据列表0.图像分辨率height)
      task(SavePicture,伪长曝光处理)
    end
    mCamera.startPreview();
  end,
}
双重曝光pictureCallback = Camera.PictureCallback
{
  onPictureTaken=function(data,camera)
    --Toast.makeText(activity, "正在保存……", Toast.LENGTH_LONG).show();
    task(save,data,数据列表0,"/sdcard/Android/data/"..activity.getPackageName().."/ImageList/",function(file)
      次数=次数+1
      拍照按钮显示文本.text=tostring(次数);
      if (次数==2) or (次数>2) then
        print("正在处理");
        拍照按钮显示文本.text="";
        双重曝光处理()
      end
    end)
    mCamera.startPreview();
  end,
}
伪长曝光autoFocus=Camera.AutoFocusCallback{
  onAutoFocus=function(success, camera)
    --success为true表示对焦成功
    if (success) then
      if (camera ~= nil) then
        --停止预览
        --camera.stopPreview();
        parameters = mCamera.getParameters();
        --设置拍照时的图片大小
        parameters.setPictureSize(1440,1080)
        mCamera.setParameters(parameters);
        -- 拍照
        camera.takePicture(nil, nil, 伪长曝光pictureCallback)
      end
    end
  end
}
双重曝光autoFocus=Camera.AutoFocusCallback{
  onAutoFocus=function(success, camera)
    --success为true表示对焦成功
    if (success) then
      if (camera ~= nil) then
        --停止预览
        --camera.stopPreview();
        -- 拍照
        camera.takePicture(nil, nil, 双重曝光pictureCallback)
      end
    end
  end
}
function tv.onClick(v)
  if 当前模式=="普通拍照" then
    mCamera.autoFocus(autoFocus)
   elseif 当前模式=="定时拍照" then
    InputLayout={
      LinearLayout;
      orientation="vertical";
      Focusable=true,
      FocusableInTouchMode=true,
      {
        SeekBar;
        --hint="输入";
        layout_marginTop="22dp";
        layout_marginBottom="22dp";
        layout_margin="10dp";
        layout_width="fill";
        layout_gravity="center",
        id="seekBar";
      };
      {
        TextView;
        --hint="输入";
        layout_marginTop="22dp";
        layout_marginBottom="22dp";
        layout_margin="10dp";
        layout_width="fill";
        layout_gravity="center",
        Gravity="center",
        id="textView";
      };
    };

    dialog=AlertDialog.Builder(this)
    .setTitle("定时拍照")
    .setView(loadlayout(InputLayout))
    .setPositiveButton("确定",{onClick=function(v)
        次数=seekBar.getProgress()+1
        拍照按钮显示文本.text=tostring(次数);
        function 定时拍照()
          task(1000,function()
            次数=次数-1
            if (次数==0) then
              mCamera.autoFocus(autoFocus)
              拍照按钮显示文本.text="";
             else
              定时拍照()
              拍照按钮显示文本.text=tostring(次数);
            end
          end)
        end
        定时拍照()
      end})
    .setNegativeButton("取消",nil)
    .show()
    DialogButtonFilter(dialog)
    seekBar.setMax(29)
    seekBar.setProgress(4)
    --绑定监听
    seekBar.setOnSeekBarChangeListener{
      onStartTrackingTouch=function()
        --开始拖动
      end,
      onStopTrackingTouch=function()
        --停止拖动
      end,
      onProgressChanged=function()
        --状态改变
        textView.text=tostring(seekBar.getProgress()+1).."秒后拍照一次(对焦所花的时间不算在这里面)"
      end}
    --状态改变
    textView.text=tostring(seekBar.getProgress()+1).."秒拍照一次(对焦所花的时间不算在这里面)"
    拖动条颜色(seekBar,Color.parseColor(强调色))
   elseif 当前模式=="连续拍照" then
    if (连续拍照状态=="打开") then
      连续拍照状态="关闭"
     else
      InputLayout={
        LinearLayout;
        orientation="vertical";
        Focusable=true,
        FocusableInTouchMode=true,
        {
          EditText;
          hint="间隔时间(秒)";
          layout_marginTop="22dp";
          layout_marginBottom="22dp";
          layout_margin="10dp";
          layout_width="fill";
          layout_gravity="center",
          id="间隔时间";
          layout_weight="1",--重力分配
          --Typeface=字体("Product");
        };
        {
          LinearLayout;
          layout_width="fill";
          orientation="horizontal";
          {
            EditText;
            hint="最多拍摄时间(秒)";
            layout_marginTop="22dp";
            layout_marginBottom="22dp";
            layout_margin="10dp";
            layout_width="fill";
            layout_gravity="center",
            id="最多拍摄时间";
            layout_weight="1",--重力分配
            --Typeface=字体("Product");
          };
          {
            Switch;
            id="最多拍摄时间Switch";
            layout_gravity="center",
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          orientation="horizontal";
          {
            EditText;
            hint="最多拍摄数量(张)";
            layout_marginTop="22dp";
            layout_marginBottom="22dp";
            layout_margin="10dp";
            layout_width="fill";
            layout_gravity="center",
            id="最多拍摄数量";
            layout_weight="1",--重力分配
            --Typeface=字体("Product");
          };
          {
            Switch;
            id="最多拍摄数量Switch";
            layout_gravity="center",
          };
        };
        {
          TextView;
          --hint="输入";
          layout_marginTop="22dp";
          layout_marginBottom="22dp";
          layout_margin="10dp";
          layout_width="fill";
          layout_gravity="center",
          Gravity="center",
          id="textView";
          text="提示：拍照之后再按一次快门就可以停止拍摄"
        };
      };
      function 判断(判断内容,ID)
        if (判断内容) then
          return true
         elseif (ID.Checked) then
          return true
         else
          return false
        end
      end
      对话框=AlertDialog.Builder(this)
      .setTitle("连续拍照")
      .setView(loadlayout(InputLayout))
      .setPositiveButton("确定",{onClick=function(v)
          频率=tonumber(间隔时间.Text)*1000
          连续拍照状态="打开"
          次数=1
          -- function 拍照()
          autoFocus3=获取AutoFocusCallback(function(file)
            import "java.io.File"

            catalog=File(数据列表0.保存位置)
            name=".jpg"
            find(catalog,name,iD)
            次数=次数+1
            task(频率,function()
              if 判断(次数<=tonumber(最多拍摄数量.Text),最多拍摄数量Switch) and 判断(次数<=tonumber(最多拍摄时间.Text),最多拍摄时间Switch) then
                if (连续拍照状态=="打开") then
                  -- 拍照
                  mCamera.takePicture(nil, nil, pictureCallback2)
                end
              end
            end)
          end)
          --end
          mCamera.autoFocus(autoFocus3)
        end})
      .setNegativeButton("取消",nil)
      对话框=对话框.show()
      DialogButtonFilter(对话框)
      --设置弹窗宽度
      local p=对话框.getWindow().getAttributes();
      p.width=(activity.Width);
      -- p.setMargins(checkValues(0));
      对话框.getWindow().setAttributes(p);
    end
   elseif 当前模式=="包围曝光" then
    次数=1
    parameters = mCamera.getParameters();
    parameters.setWhiteBalance(当前支持的白平衡值[次数])
    mCamera.setParameters(parameters);
    autoFocus3=获取AutoFocusCallback(function(file)
      --Toast.makeText(activity, "图片保存完毕，"..tostring(file), Toast.LENGTH_LONG).show();
      if (次数<=10) then
        parameters = mCamera.getParameters();
        parameters.setExposureCompensation(次数)
        mCamera.setParameters(parameters);
        mCamera.autoFocus(autoFocus3)
        -- 拍照
        mCamera.takePicture(nil, nil, pictureCallback2)
        次数=次数+1
      end
      import "java.io.File"

      catalog=File(数据列表0.保存位置)
      name=".jpg"
      find(catalog,name,iD)
    end)
    mCamera.autoFocus(autoFocus3)

    parameters = mCamera.getParameters();
    parameters.setExposureCompensation(0)--设置感光度
    mCamera.setParameters(parameters);
   elseif 当前模式=="包围白平衡" then
    parameters = mCamera.getParameters();
    --之前的白平衡值=parameters.WhiteBalance
    次数=1
    parameters = mCamera.getParameters();
    parameters.setWhiteBalance(当前支持的白平衡值[次数])
    mCamera.setParameters(parameters);
    autoFocus3=获取AutoFocusCallback(function(file)
      --Toast.makeText(activity, "图片保存完毕，"..tostring(file), Toast.LENGTH_LONG).show();
      if (次数<=#当前支持的白平衡值) then
        parameters = mCamera.getParameters();
        parameters.setWhiteBalance(当前支持的白平衡值[次数])
        mCamera.setParameters(parameters);
        -- 拍照
        mCamera.takePicture(nil, nil, pictureCallback2)
        次数=次数+1
      end
      import "java.io.File"

      catalog=File(数据列表0.保存位置)
      name=".jpg"
      find(catalog,name,iD)
    end)
    mCamera.autoFocus(autoFocus3)

    parameters = mCamera.getParameters();
    parameters.setWhiteBalance("auto")--设置感光度
    mCamera.setParameters(parameters);
   elseif 当前模式=="伪长曝光" then
    if (伪长曝光状态=="打开") then
      伪长曝光状态="关闭"
     else
      伪长曝光状态="打开"
      mCamera.autoFocus(伪长曝光autoFocus)
    end
    次数=0
    拍照按钮显示文本.text=tostring(次数);
   elseif 当前模式=="双重曝光" then
    if (双重曝光状态=="打开") then
      mCamera.autoFocus(双重曝光autoFocus)
     else
      双重曝光状态="打开"
      mCamera.autoFocus(双重曝光autoFocus)
      次数=0
      拍照按钮显示文本.text=tostring(次数);
    end
   elseif 当前模式=="方形拍照" then
    方形列表={}
    for d,内容 in pairs(最高分辨率表) do
      if 内容.width==内容.height then
        table.insert(方形列表,内容)
      end
    end
    table.sort(方形列表,function(a,b)
      return ((a.width)>(b.width))
    end)
    parameters = mCamera.getParameters();
    --设置拍照时的图片大小
    parameters.setPictureSize(方形列表[1].width,方形列表[1].height);
    mCamera.setParameters(parameters);
    autoFocus3=获取AutoFocusCallback(function(file)
      parameters = mCamera.getParameters();
      --设置拍照时的图片大小
      parameters.setPictureSize(数据列表0.图像分辨率width,数据列表0.图像分辨率height);
      mCamera.setParameters(parameters);
      import "java.io.File"

      catalog=File(数据列表0.保存位置)
      name=".jpg"
      find(catalog,name,iD)
    end)
    mCamera.autoFocus(autoFocus3)
   elseif 当前模式=="HDR" then
    HDR状态="打开"
    次数=0
    autoFocus3=获取AutoFocusCallback(function(file)
      次数=次数+1
      拍照按钮显示文本.text=tostring(次数);
      if 次数==3 then
        拍照按钮显示文本.text="";
        HDR状态="关闭";
        task(伪长曝光处理,SavePicture,function()end)
       else
        mCamera.autoFocus(autoFocus3)
      end
    end,"/sdcard/Android/data/"..activity.getPackageName().."/ImageList/")
    mCamera.autoFocus(autoFocus3)
    拍照按钮显示文本.text=tostring(次数);
   elseif 当前模式=="普通录像" then
    if 录像状态=="正在录像" then
      录像状态="未在录像"
      录像.stop()
      录像.release()
      --控件不可视
      录像停止按钮.setVisibility(View.INVISIBLE)
      控件边框(tv0,dp2px(40),"#ffffffff","#FFDDDDDD",dp2px(6))
      mCamera.lock()
     else
      录像状态="正在录像"
      import("android.media.MediaRecorder")
      mCamera.stopPreview();
      mCamera.unlock()
      录像=MediaRecorder()
      --设置预览
      录像.setPreviewDisplay(sureface.getHolder().getSurface());
      录像.setCamera(mCamera)
      录像.setAudioSource(MediaRecorder.AudioSource.DEFAULT)
      录像.setVideoSource(MediaRecorder.VideoSource.DEFAULT)
      录像.setOutputFormat(MediaRecorder.OutputFormat.DEFAULT)
      录像.setAudioEncoder(MediaRecorder.AudioEncoder.DEFAULT)
      录像.setVideoEncoder(MediaRecorder.VideoEncoder.DEFAULT)

      import("android.media.CamcorderProfile")
      mProfile = CamcorderProfile.get(CamcorderProfile.QUALITY_HIGH);
      -- 设置视频录制的分辨率。必须放在设置编码和格式的后面，否则报错
      录像.setVideoSize(tonumber(数据列表0.视频分辨率width),tonumber(数据列表0.视频分辨率height));
      --设置所录制视频的编码格式
      --录像.setVideoEncoder(MediaRecorder.VideoEncoder.H264)
      -- 设置录制的视频帧率。必须放在设置编码和格式的后面，否则报错
      录像.setVideoFrameRate(30);
      -- 所说越大清晰度最高（但是我自己测试5*1024*1024是最清晰的）
      录像.setVideoEncodingBitRate(5*1024*1024);
      file = File(数据列表0.保存位置.."VID" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. ".mp4");
      file.createNewFile();
      录像.setOutputFile(file)
      录像.prepare()
      录像.start()
      --控件可视
      录像停止按钮.setVisibility(View.VISIBLE)
      控件边框(tv0,dp2px(40),"#FF272727","#FF272727",dp2px(6))
    end
  end
end
