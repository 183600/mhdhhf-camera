function 拍照(当前模式)
  mCameraCharacteristics=Cameramanager.getCameraCharacteristics(mCameraid)
  streamConfigurationMap = mCameraCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
  --支持的分辨率
  mOutputSizes = streamConfigurationMap.getOutputSizes(ImageFormat.JPEG);
  mOutputSize =luajava.astable(mOutputSizes)[1]
  xpcall(function()
    --支持的RAW分辨率
    mRAWOutputSizes = streamConfigurationMap.getOutputSizes(ImageFormat.RAW_SENSOR);
    mRAWOutputSize =luajava.astable(mRAWOutputSizes)[1]
  end,function(e)
  end) --print(mRAWOutputSize)
  import "android.media.ImageReader"
  mRAWImageReader=ImageReader.newInstance(mRAWOutputSize.Width,mRAWOutputSize.Height,--先Width再Height
  ImageFormat.RAW_SENSOR, 1);--ImageFormat.JPEG
  图像格式0=ImageFormat.JPEG
  if 当前模式=="方形拍照" then
    mImageReader=ImageReader.newInstance(方形列表[1].width,方形列表[1].height,--先Width再Height
    图像格式0, 1);--ImageFormat.JPEG
   else
    if 是否使用前置摄像头 then
      mImageReader=ImageReader.newInstance(mOutputSize.width,mOutputSize.height,--先Width再Height
      图像格式0, 3);--ImageFormat.JPEG
     else
      mImageReader=ImageReader.newInstance(数据列表0.图像分辨率width,数据列表0.图像分辨率height,--先Width再Height
      图像格式0, 3);--ImageFormat.JPEG
    end
  end
  if 当前模式=="双重曝光" or 当前模式=="伪长曝光" then
    格式.Text=string.upper(数据列表0.图像格式)
  end
  Cameradevice=mCameradevice
  --function 保存RAW()
  --end
  if (数据列表0.是否软件内处理图像) then
    if 当前模式=="HDR" then
      Surface列表={mImageReader.getSurface()}
           else
      Surface列表={mRAWImageReader.getSurface()}
    end
   else
    if 当前模式=="HDR" then
      Surface列表={mImageReader.getSurface()}
      elseif 格式.Text=="RAW+"..string.upper(数据列表0.图像格式) then
      Surface列表={mImageReader.getSurface(),mRAWImageReader.getSurface()}
     elseif 格式.Text=="RAW" then
      Surface列表={mRAWImageReader.getSurface()}
     elseif 格式.Text==string.upper(数据列表0.图像格式) then
      Surface列表={mImageReader.getSurface()}
    end
  end
  Cameradevice.createCaptureSession(Surface列表,CameraCaptureSession.StateCallback{
    onActive=function()
    end,
    onConfigured=function(mCameraCaptureSession)
      mCaptureCallback =CameraCaptureSession.CaptureCallback{
        onCaptureCompleted=function(reader,mCaptureRequest,mTotalCaptureResult)--onCaptureCompleted
          -- print(mCameraCharjacteristics)
          wreader=wreader
          mCaptureRequest=mCaptureRequest
          mTotalCaptureResult=mTotalCaptureResult
          mRAWImageReader.setOnImageAvailableListener(ImageReader.OnImageAvailableListener{
            onImageAvailable=function(reader)
              image = reader.acquireLatestImage();
              buffer = image.getPlanes()[0].getBuffer();
              data = byte[buffer.remaining()];
              data2 = buffer.remaining();
              data3=buffer.get(data)
              image.close()
              import "android.util.Size"
              import "android.hardware.camera2.*"
              --接下来的工作就是把Bitmap保存成一个存储卡中的文件
              if (数据列表0.是否软件内处理图像) then
                if 当前模式=="双重曝光" then
                  file = File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/".."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. ".dng");
                  file.createNewFile();
                  file2 = File(("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/").."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式);
                  file2.createNewFile();
                 else
                  if 格式.Text=="RAW+"..string.upper(数据列表0.图像格式) then
                    file = File(数据列表0.保存位置.."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. ".dng");
                    file.createNewFile();
                    file2 = File((数据列表0.保存位置).."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式);
                    file2.createNewFile();
                   elseif 格式.Text=="RAW" then
                    file = File(数据列表0.保存位置.."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. ".dng");
                    file.createNewFile();
                   else
                    file = File("/sdcard/Android/data/"..activity.getPackageName().."/临时.dng");
                    file.createNewFile();
                    file2 = File((数据列表0.保存位置).."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式);
                    file2.createNewFile();
                  end
                end
               else
                file = File(数据列表0.保存位置.."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. ".dng");
                file.createNewFile();
              end
              mBufferedOutputStream = FileOutputStream(file);
              os2 = FileInputStream(file);
              mDngCreator=DngCreator(mCameraCharacteristics,mTotalCaptureResult)
              --mDngCreator.writeInputStream(mBufferedOutputStream,mRAWOutputSize,os2,long(0))
              --mDngCreator.writeImage(mBufferedOutputStream,image)
              mDngCreator.writeByteBuffer(mBufferedOutputStream,mRAWOutputSize,buffer,long(0))
              if (数据列表0.是否软件内处理图像) then
                if 格式.Text=="RAW" then
                 else
                  --设置的图片也可以输入路径
                  SavePicture(file2,处理图片(tostring(file)),save后)
                end
                if 格式.Text=="RAW+"..string.upper(数据列表0.图像格式) then
                  print("RAW与"..string.upper(数据列表0.图像格式).."保存成功")
                 else
                  print(string.upper(数据列表0.图像格式).."保存成功")
                  --使用File类
                  import "java.io.File"--导入File类
                  file.delete()
                end
               else
                print("RAW保存成功")
              end
              预览(是否使用前置摄像头)
            end
          },nil)
          if (是否手动控制) then
            ISO当前状态.text=tostring(mTotalCaptureResult.get(TotalCaptureResult.SENSOR_SENSITIVITY))
            当前自动曝光时间=(mTotalCaptureResult.get(TotalCaptureResult.SENSOR_EXPOSURE_TIME))
            if 当前自动曝光时间>1000000000 then
              曝光时间当前状态.text=tostring(当前自动曝光时间/1000000000)
             elseif 当前自动曝光时间==1000000000 then
              曝光时间当前状态.text=tostring(当前自动曝光时间/1000000000)
             else
              曝光时间当前状态.text="1/"..tostring(四舍五入(1000000000/当前自动曝光时间,0))
            end
          end
          --if 格式.Text==string.upper(数据列表0.图像格式) or 格式.Text=="RAW+"..string.upper(数据列表0.图像格式) then

          mImageReader.setOnImageAvailableListener(ImageReader.OnImageAvailableListener{
            onImageAvailable=function(reader)
              if 当前模式=="HDR" then
                print("开始保存")
               else
                print("开始保存")
              end
              image = reader.acquireLatestImage();
              --print(image)
              buffer = image.getPlanes()[0].getBuffer();
              data = byte[buffer.remaining()];
              data2 = buffer.remaining();
              buffer.get(data)
              --print(image,buffer,data,data2)
              image.close()
              if 当前模式=="双重曝光" or
                当前模式=="伪长曝光" or
                当前模式=="HDR" or
                数据列表0.是否启用水印
                then
                路径="/sdcard/Android/data/"..activity.getPackageName().."/ImageList/"
               else
                路径=nil
              end
              if (是否手动控制) then
               else
                if 格式.Text==string.upper(数据列表0.图像格式) then
                  预览(是否使用前置摄像头)
                end
              end
              task(save,data,数据列表0,路径,当前模式,save后)
              if 当前模式=="连续拍照" then
                次数=次数+1
                拍照按钮显示文本.text=tostring(次数);
                task(频率,function()
                  if 判断(次数<=tonumber(最多拍摄数量.Text),最多拍摄数量Switch) and 判断(次数<=tonumber(最多拍摄时间.Text),最多拍摄时间Switch) then
                    if (连续拍照状态=="打开") then
                      拍照(当前模式)
                    end
                  end
                end)
              end
            end
          },nil)
        end
      }
      function 拍照2()
        if (数据列表0.是否软件内处理图像) then
          if 当前模式=="伪长曝光" then
            mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_STILL_CAPTURE,mImageReader.getSurface())
           elseif 当前模式=="HDR" then
            mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_STILL_CAPTURE,mImageReader.getSurface())
           else
            mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_STILL_CAPTURE,mRAWImageReader.getSurface())
          end
         else
          if 当前模式=="HDR" then
            mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_STILL_CAPTURE,mImageReader.getSurface())
            else
            if 格式.Text=="RAW+"..string.upper(数据列表0.图像格式) then
              mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_STILL_CAPTURE,mImageReader.getSurface())
              -- 将surface设为目标
              mCaptureRequestBuilder.addTarget(mRAWImageReader.getSurface());
             elseif 格式.Text=="RAW" then
              mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_STILL_CAPTURE,mRAWImageReader.getSurface())
             else
              mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_STILL_CAPTURE,mImageReader.getSurface())
            end
          end
        end
        -- Toast.makeText(activity, "正在保存……", Toast.LENGTH_LONG).show();
        mCaptureRequest=mCaptureRequestBuilder.build()
        mCameraCaptureSession.capture(mCaptureRequest,mCaptureCallback, nil);
      end
      拍照2()
    end,
    onClosed=function()
    end
  },nil)
end
function 录像()
  if 录像状态=="正在录像" then
    录像状态="未在录像"
    mMediaRecorder.stop()
    mMediaRecorder.release()
    --控件不可视
    录像停止按钮.setVisibility(View.INVISIBLE)
    控件边框(tv0,dp2px(40),"#ffffffff","#FFDDDDDD",dp2px(6))
    预览(是否使用前置摄像头)
   else
    录像状态="正在录像"
    mCameraCharacteristics=Cameramanager.getCameraCharacteristics(mCameraid)
    streamConfigurationMap = mCameraCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
    mMediaRecorder=MediaRecorder()
    mMediaRecorder.setAudioSource(MediaRecorder.AudioSource.MIC)
    mMediaRecorder.setVideoSource(MediaRecorder.VideoSource.SURFACE)
    mMediaRecorder.setOutputFormat(MediaRecorder.OutputFormat.DEFAULT)
    mMediaRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.DEFAULT)
    mMediaRecorder.setVideoEncoder(MediaRecorder.VideoEncoder.DEFAULT)
    import("android.media.CamcorderProfile")
    mProfile = CamcorderProfile.get(CamcorderProfile.QUALITY_HIGH);
    -- 设置视频录制的分辨率。必须放在设置编码和格式的后面，否则报错
    mMediaRecorder.setVideoSize(tonumber(数据列表0.视频分辨率width),tonumber(数据列表0.视频分辨率height));
    --设置所录制视频的编码格式
    --录像.setVideoEncoder(MediaRecorder.VideoEncoder.H264)
    -- 设置录制的视频帧率。必须放在设置编码和格式的后面，否则报错
    mMediaRecorder.setVideoFrameRate(20);
    -- 所说越大清晰度最高（但是我自己测试5*1024*1024是最清晰的）
    mMediaRecorder.setVideoEncodingBitRate(30*1024*1024);
    --mMediaRecorder.setOrientationHint(90);
    --设置预览
    mMediaRecorder.setPreviewDisplay(mSurface);

    file = File(数据列表0.保存位置.."VID" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. ".mp4");
    file.createNewFile();
    mMediaRecorder.setOutputFile(file.getAbsolutePath())
    mMediaRecorder.prepare()
    mMediaRecorder.start()
    --控件可视
    录像停止按钮.setVisibility(View.VISIBLE)
    控件边框(tv0,dp2px(40),"#FF272727","#FF272727",dp2px(6))
    Cameradevice=mCameradevice
    mMediaRecorderSurface=(mMediaRecorder.getSurface())
    Cameradevice.createCaptureSession({mSurface,mMediaRecorderSurface},CameraCaptureSession.StateCallback{
      onActive=function()
      end,
      onConfigured=function(mCameraCaptureSession)
        mCaptureCallback =CameraCaptureSession.CaptureCallback{
          onCaptureCompleted=function(reader)--onCaptureCompleted
          end
        }
        mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_RECORD,mSurface)
        -- 将录像surface设为目标
        mCaptureRequestBuilder.addTarget(mMediaRecorderSurface);
        -- Toast.makeText(activity, "正在保存……", Toast.LENGTH_LONG).show();
        mCaptureRequest=mCaptureRequestBuilder.build()
        mCameraCaptureSession.setRepeatingRequest(mCaptureRequest,mCaptureCallback, nil)
        --- mMediaRecorder.start()
      end,
      onClosed=function()
      end
    },nil)
  end
end
function tv.onClick(v)
  if 当前模式=="普通拍照" then
    拍照(当前模式)
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
              拍照(当前模式)
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
          次数=0
          -- function 拍照()
          拍照(当前模式)
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
    次数=0
    拍照(当前模式)
    拍照按钮显示文本.text=tostring(次数);
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
    拍照(当前模式)
   elseif 当前模式=="伪长曝光" then
    if (伪长曝光状态=="打开") then
      伪长曝光状态="关闭"
     else
      伪长曝光状态="打开"
      拍照(当前模式)
      次数=0
      拍照按钮显示文本.text=tostring(次数);
    end
   elseif 当前模式=="双重曝光" then
    if (双重曝光状态=="打开") then
      拍照(当前模式)
     else
      双重曝光状态="打开"
      拍照(当前模式)
      次数=0
      拍照按钮显示文本.text=tostring(次数);
    end
   elseif 当前模式=="HDR" then
    --[[ if (HDR状态=="打开") then
      拍照(当前模式)
     else]]
    HDR状态="打开"
    次数=0
    拍照(当前模式)
    拍照按钮显示文本.text=tostring(次数);
    --end
   elseif 当前模式=="普通录像" then
    录像()
  end
end
function save后()
  if 当前模式=="双重曝光" then
    次数=次数+1
    拍照按钮显示文本.text=tostring(次数);
    if (次数==2) or (次数>2) then
      print("正在处理");
      拍照按钮显示文本.text="";
      双重曝光处理()
    end
   elseif 当前模式=="伪长曝光" then
    if (伪长曝光状态=="打开") then
      拍照(当前模式)
      次数=次数+1
      拍照按钮显示文本.text=tostring(次数);
     else
      print("正在处理");
      拍照按钮显示文本.text="";
      获取SavePicture()
      task(伪长曝光处理,SavePicture,function()end)
    end
   elseif 当前模式=="包围曝光" then
    if 次数==2 then
     else
      拍照(当前模式)
    end
    次数=次数+1
    import "java.io.File"

    catalog=File(数据列表0.保存位置)
    name=".jpg"
    find(catalog,name,iD)
   elseif 当前模式=="HDR" then
    次数=次数+1
    拍照按钮显示文本.text=tostring(次数);
    if 次数==3 then
      拍照按钮显示文本.text="";
      HDR状态="关闭";
      task(伪长曝光处理,SavePicture,function()end)
     else
      拍照(当前模式)
    end
   elseif 数据列表0.是否启用水印 then
    水印处理()
   else
    print(string.upper(数据列表0.图像格式).."保存成功")
    import "java.io.File"

    catalog=File(数据列表0.保存位置)
    name=".jpg"
    find(catalog,name,iD)
  end
end