require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "mod"
import "layout2"
import "java.lang.Object"
import "android.graphics.Color"
import "android.graphics.Matrix"
import "android.graphics.Paint"
import "android.graphics.Canvas"
import "android.R"
import "android.graphics.BitmapFactory"
import "android.graphics.Bitmap"
import "java.lang.Boolean"
import "android.hardware.camera2.*"
import "android.hardware.camera2.CameraDevice$StateCallback"
import("android.media.MediaRecorder")
--作者qwe12345678
activity.setTheme(android.R.style.Theme_Material)
activity.ActionBar.hide()
activity.setContentView(loadlayout(layout2))
--手动对焦值=Object().wait(long("3"))
当前曝光时间=(1000000000/80)
当前ISO=100
当前焦距=0
当前状态=""
当前模式="普通拍照"
是否c2="是"
是否第1次加载相机="是"
重力 = 0
是否使用前置摄像头=true
闪光灯模式=CaptureRequest.FLASH_MODE_OFF
当前滤镜=CaptureRequest.CONTROL_EFFECT_MODE_OFF
是否手动控制=false
是否手动对焦=false
当前曝光补偿=0
对焦锁=false
曝光锁=false
是否支持RAW=true

function string2tab(t)
  return load(table.concat({"return ",t},""))()
end

import "java.io.File"
function 写入文件(路径,内容)
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end
function 文件是否存在(id)
  return File(id).exists()
end
function 提示(text)
  --普通对话框
  qweasd=AlertDialog.Builder(this)
  .setTitle("内容查看")
  .setMessage(tostring(text))
  --.setNeutralButton("中立",nil)
  .setNegativeButton("确定",nil)
  .show()
  message=qweasd.findViewById(android.R.id.message)
  message.TextIsSelectable=true
end
import "layout"
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
activity.setTheme(android.R.style.Theme_Material)
activity.ActionBar.hide()
--activity.setContentView(loadlayout(layout))
import "android.hardware.Camera"
import "android.graphics.*"
import "java.io.*"
import "android.content.*"
import "android.text.format.DateFormat"

--activity.setTitle('AndroLua')
function 判断是否隐藏滑动条(m)
  if (seekBar背景父布局.Visibility==View.INVISIBLE) then
    --控件可视
    seekBar背景父布局.setVisibility(View.VISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    底部菜单.startAnimation(透明动画)
    task(96,function()
      --控件不可视
      底部菜单2.setVisibility(View.INVISIBLE)
    end)
    import"android.view.animation.TranslateAnimation"
    --上升动画
    --相关参数，请自行手册查询
    --定义动画,500为上升高度
    yuxuandh3=TranslateAnimation(0,0,activity.height,0)
    --动画时间，也就是上升动画的快慢
    yuxuandh3.setDuration(300)
    --动画开始执行
    seekBar背景.startAnimation(yuxuandh3);
    seekBar背景.BackgroundColor=0x60000000
   else
    import"android.view.animation.TranslateAnimation"
    --控件不可视
    seekBar背景父布局.setVisibility(View.INVISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    底部菜单.startAnimation(透明动画)
    task(96,function()
      --控件可视
      底部菜单2.setVisibility(View.VISIBLE)
    end)
    当前状态="无"
    --上升动画
    --相关参数，请自行手册查询
    --定义动画,500为上升高度
    yuxuandh3=TranslateAnimation(0,0,0,activity.height)
    --动画时间，也就是上升动画的快慢
    yuxuandh3.setDuration(300)
    --动画开始执行
    seekBar背景.startAnimation(yuxuandh3);
    task(300,function()
      seekBar背景.BackgroundColor=0x00000000
    end)
  end
end
function save(data,数据列表0,路径,当前模式)
  require "import"
  import "android.graphics.*"
  import "java.io.*"
  import "android.content.*"
  import "android.text.format.DateFormat"
  --print(data)
  if (数据列表0.图像格式=="jpg") then
    编码格式=Bitmap.CompressFormat.JPEG
   elseif (数据列表0.图像格式=="png") then
    编码格式=Bitmap.CompressFormat.PNG
   elseif (数据列表0.图像格式=="webp") then
    编码格式=Bitmap.CompressFormat.WEBP
  end
  --用BitmapFactory.decodeByteArray()方法可以把相机传回的裸数据转换成Bitmap对象
  mBitmap = BitmapFactory.decodeByteArray(data, 0, #data);
  --接下来的工作就是把Bitmap保存成一个存储卡中的文件
  file = File((路径 or 数据列表0.保存位置).."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式);
  file.createNewFile();
  os = BufferedOutputStream(FileOutputStream(file));
  if 当前模式=="HDR" then
    mBitmap.compress(编码格式,80, os);
   else
    mBitmap.compress(编码格式,数据列表0.图像质量, os);
  end
  os.flush();
  os.close();
  --import("android.media.ExifInterface")
  --Exif=ExifInterface(file)
  当前模式=当前模式 or ""
  return tostring(file),当前模式
end

--控件不可视
seekBar背景父布局.setVisibility(View.INVISIBLE)
--控件不可视
菜单卡片.setVisibility(View.INVISIBLE)
--控件不可视
对焦点.setVisibility(View.INVISIBLE)

内背景.onTouch=function(v,e)
  x=e.getX()
  y=e.getY()-getStatusBarHeight()
  对焦点父布局.x=x
  对焦点父布局.y=y
  y=tonumber(y)-tonumber(工具箱LinearLayout.LayoutParams.height)
  --控件可视
  对焦点.setVisibility(View.VISIBLE)
  --设置动画的属性
  透明动画=AlphaAnimation(0,1)
  透明动画.setDuration(160)--设置动画时间
  透明动画.setFillAfter(true)--设置动画后停留位置
  透明动画.setRepeatCount(0)--设置无限循环
  --绑定动画
  对焦点父布局.startAnimation(透明动画)
  切换至自动对焦()
  mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, CaptureRequest.CONTROL_AF_MODE_AUTO);
  mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, CameraMetadata.CONTROL_AF_TRIGGER_START);
  mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, CameraMetadata.CONTROL_AE_PRECAPTURE_TRIGGER_START);
  import "android.content.Context"
  --导入包
  vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
  vibrator.vibrate( long{0,18} ,-1)
  --{等待时间,振动时间,等待时间,振动时间,…}
  --{0,1000,500,1000,500,1000}
  --别忘了申明权限
  task(800,function()
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(160)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    对焦点父布局.startAnimation(透明动画)
    task(96,function()
      --控件不可视
      对焦点.setVisibility(View.INVISIBLE)
    end)
  end)
end
import "paizhao2"

function 获取CaptureRequestBuilder(Cameradevice,拍摄模式,mSurface,对焦)
  mCaptureRequestBuilder=Cameradevice.createCaptureRequest(拍摄模式)
  xpcall(function()
    --降噪模式
    mCaptureRequestBuilder.set(CaptureRequest.NOISE_REDUCTION_MODE,降噪模式);
  end,function(e)
    --控件隐藏
    降噪LinearLayout.setVisibility(View.GONE)
  end)
  if (是否支持闪光灯) then
    --闪光灯模式
    mCaptureRequestBuilder.set(CaptureRequest.FLASH_MODE,闪光灯模式);
  end
  if (对焦) then
    --触发对焦
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER,CaptureRequest.CONTROL_AF_TRIGGER_START);
  end
  --防牛顿环配置
  if (数据列表0.防牛顿环配置=="auto") then
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_ANTIBANDING_MODE,CaptureRequest.CONTROL_AE_ANTIBANDING_MODE_AUTO);
   elseif (数据列表0.防牛顿环配置=="50hz") then
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_ANTIBANDING_MODE,CaptureRequest.CONTROL_AE_ANTIBANDING_MODE_50HZ);
   elseif (数据列表0.防牛顿环配置=="60hz") then
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_ANTIBANDING_MODE,CaptureRequest.CONTROL_AE_ANTIBANDING_MODE_60HZ);
   elseif (数据列表0.防牛顿环配置=="off") then
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_ANTIBANDING_MODE,CaptureRequest.CONTROL_AE_ANTIBANDING_MODE_OFF);
  end
  if 闪光灯模式==CaptureRequest.FLASH_MODE_SINGLE or 闪光灯模式==CaptureRequest.FLASH_MODE_TORCH then
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_ON);
    mCaptureRequestBuilder.set(CaptureRequest.FLASH_MODE, CaptureRequest.FLASH_MODE_TORCH);
  end
  if (是否为预览) then
    if (当前曝光时间>1000000000) then
      当前曝光时间0=1000000000
     else
      当前曝光时间0=当前曝光时间
    end
   else
    当前曝光时间0=当前曝光时间
  end
  --mCaptureRequestBuilder.set(CaptureRequest.SCALER_CROP_REGION,long(变焦倍数))
  if (是否手动控制 or 曝光锁) then
    --禁用所有自动设置
    --mCaptureRequestBuilder.set(CaptureRequest.CONTROL_MODE, CaptureRequest.CONTROL_MODE_OFF);
    --只是禁用曝光，白平衡继续开启,自己设置iso等值，必须禁用曝光
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_OFF)
    mCaptureRequestBuilder.set(CaptureRequest.SENSOR_EXPOSURE_TIME,long(当前曝光时间0))
    mCaptureRequestBuilder.set(CaptureRequest.SENSOR_SENSITIVITY,当前ISO)
   else
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, 当前曝光补偿)
  end
  if (是否手动对焦 or 对焦锁) then
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, CameraMetadata.CONTROL_AF_MODE_OFF);
    mCaptureRequestBuilder.set(CaptureRequest.LENS_FOCUS_DISTANCE,Float(当前焦距));
   else
    -- 设置自动对焦模式
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE,CaptureRequest.CONTROL_AF_MODE_CONTINUOUS_PICTURE);
  end
  if 当前模式=="HDR" then
    mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, CameraMetadata.CONTROL_AF_MODE_OFF);
  end
  if 当前模式=="包围曝光" then
    if 拍摄模式==Cameradevice.TEMPLATE_STILL_CAPTURE then
      if 次数==0 then
        当前曝光时间1=当前曝光时间0/2
       elseif 次数==1 then
        当前曝光时间1=当前曝光时间0
       elseif 次数==2 then
        当前曝光时间1=当前曝光时间0*2
      end
      --只是禁用曝光，白平衡继续开启,自己设置iso等值，必须禁用曝光
      mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_OFF)
      mCaptureRequestBuilder.set(CaptureRequest.SENSOR_EXPOSURE_TIME,long(当前曝光时间1))
      mCaptureRequestBuilder.set(CaptureRequest.SENSOR_SENSITIVITY,当前ISO)
    end
  end
  if 当前模式=="HDR" then
    if 拍摄模式==Cameradevice.TEMPLATE_STILL_CAPTURE then
      if 次数==0 then
        当前曝光时间1=当前自动曝光时间/4
       elseif 次数==1 then
        当前曝光时间1=当前自动曝光时间
       elseif 次数==2 then
        当前曝光时间1=当前自动曝光时间*8
      end
      --只是禁用曝光，白平衡继续开启,自己设置iso等值，必须禁用曝光
      mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_OFF)
      mCaptureRequestBuilder.set(CaptureRequest.SENSOR_EXPOSURE_TIME,long(当前曝光时间1))
      mCaptureRequestBuilder.set(CaptureRequest.SENSOR_SENSITIVITY,当前ISO)
    end
  end
  --mCaptureRequestBuilder.set(CaptureRequest.CONTROL_SCENE_MODE, CaptureRequest.CONTROL_SCENE_MODE_HDR)
  -- 将surface设为目标
  mCaptureRequestBuilder.addTarget(mSurface);
  return mCaptureRequestBuilder
end



texture.SurfaceTextureListener={
  onSurfaceTextureAvailable=function(SurfaceTexture)
    mSurfaceTexture=SurfaceTexture
    function 预览2(对焦)
      Cameradevice=mCameradevice
      if (对焦) then
        mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_PREVIEW,mSurface,true)
       else
        mCaptureRequestBuilder=获取CaptureRequestBuilder(Cameradevice,Cameradevice.TEMPLATE_PREVIEW,mSurface)
      end
      mCaptureCallback =CameraCaptureSession.CaptureCallback{
        onCaptureCompleted=function(reader,mCaptureRequest,mTotalCaptureResult)--onCaptureCompleted
          mTotalCaptureResult2=mTotalCaptureResult
          目前自动对焦值=四舍五入(tonumber(mTotalCaptureResult.get(TotalCaptureResult.LENS_FOCUS_DISTANCE)),3)
          if (是否手动对焦) then
           else
            if (当前状态=="焦距") then
              -- seekBar.Progress=tonumber(目前自动对焦值)
            end
            焦距当前状态.text=tostring(目前自动对焦值)
          end
          --print(目前对焦值)
          当前ISO=mTotalCaptureResult.get(TotalCaptureResult.SENSOR_SENSITIVITY)
          if (是否手动控制) then
           else
            if (当前状态=="ISO") then
              --seekBar.Progress=tonumber(当前ISO)
            end
            ISO当前状态.text=tostring(当前ISO)
          end
          当前自动曝光时间=(mTotalCaptureResult.get(TotalCaptureResult.SENSOR_EXPOSURE_TIME))
          当前曝光时间=当前自动曝光时间
          if (是否手动控制) then
           else
            if 当前自动曝光时间>1000000000 then
              曝光时间当前状态.text=tostring(当前自动曝光时间/1000000000)
             elseif 当前自动曝光时间==1000000000 then
              曝光时间当前状态.text=tostring(当前自动曝光时间/1000000000)
             else
              曝光时间当前状态.text="1/"..tostring(四舍五入(1000000000/当前自动曝光时间,0))
            end
          end
        end
      }
      mCaptureRequest=mCaptureRequestBuilder.build()
      CameracaptureSession.setRepeatingRequest(mCaptureRequest,mCaptureCallback, nil)
    end
    function 预览()
      Statecallback=StateCallback{
        onDisconnected=function()
        end,
        onOpened=function(Cameradevice)
          mCameradevice=Cameradevice
          mSurface=Surface(texture.getSurfaceTexture())
          texture.getSurfaceTexture().setDefaultBufferSize(1440,1080);--setDefaultBufferSize
          import "android.media.ImageReader"
          Cameradevice.createCaptureSession({mSurface},CameraCaptureSession.StateCallback{
            onActive=function()
            end,
            onConfigured=function(mCameraCaptureSession,t,y,u,i)
              CameracaptureSession=mCameraCaptureSession
              预览2()
            end,
            onClosed=function()
            end
          },nil)
        end
      }
      Cameramanager=activity.getSystemService(Context.CAMERA_SERVICE)
      mCameraIdList=(luajava.astable(Cameramanager.getCameraIdList()))
      -- print(CameraCharacteristics.LENS_FACING_BACK)
      for d,内容 in pairs(mCameraIdList) do
        if tostring(内容)==tostring(CameraCharacteristics.LENS_FACING_BACK) then
          if (是否使用前置摄像头==true) then
           elseif (是否使用前置摄像头==false) then
            mCameraid=(内容)
           else
            if (tostring(内容)==是否使用前置摄像头) then
              mCameraid=(内容)
            end
          end
         elseif tostring(内容)==tostring(CameraCharacteristics.LENS_FACING_FRONT) then
          if (是否使用前置摄像头==true) then
            mCameraid=(内容)
           elseif (是否使用前置摄像头==false) then
           else
            if (tostring(内容)==是否使用前置摄像头) then
              mCameraid=(内容)
            end
          end
        end
      end
      mCameraCharacteristics=Cameramanager.getCameraCharacteristics(mCameraid)
      --print(mCameraCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_APERTURES))
      xpcall(function()
        曝光时间范围 = mCameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE);
        曝光时间max = 曝光时间范围.getUpper();
        曝光时间min = 曝光时间范围.getLower();
        曝光时间差=曝光时间max-曝光时间min
        曝光时间表={
          200000,
          100000,
          80000,
          50000,
          20000,
          10000,
          8000,
          5000,
          4000,
          3000,
          2000,
          1000,
          900,
          800,
          700,
          600,
          500,
          300,
          200,
          100,
          90,
          80,
          70,
          60,
          50,
          40,
          30,
          25,
          20,
          18,
          15,
          12,
          10,
          8,
          5,
          4,
          3,
          2,
          "1",
          "2",
          "5",
          "8",
          "10",
          "15",
          "20",
          "25",
          "30",
          "40",
          "50",
          "60",
        }
        曝光时间表0={}
        for d,内容 in pairs(曝光时间表) do
          if 内容==tostring(内容) then
            if 曝光时间max>1000000000 or
              曝光时间max==1000000000
              then
              if tonumber(内容)*1000000000<曝光时间max then
                曝光时间表0[d]=内容
              end
            end
           elseif 内容<(1000000000/曝光时间min) then
            曝光时间表0[d]=内容
          end
        end
        曝光时间.onClick=function()
          切换是否手动控制.text="M"
          是否手动控制=true
          当前状态="曝光时间"
          seekBar.setMax(#曝光时间表0-2)
          seekBar.setProgress(0)
          for d,内容 in pairs(曝光时间表0) do
            if 内容==80 then
              seekBar.setProgress(d-2)
            end
          end
          if 曝光时间表0[2]==tostring(曝光时间表0[2]) then
            seekBar左.text=tostring(曝光时间表0[2])
           else
            seekBar左.text="1/"..tostring(曝光时间表0[2])
          end
          if 曝光时间表0[#曝光时间表0]==tostring(曝光时间表0[#曝光时间表0]) then
            seekBar右.text=tostring(曝光时间表0[#曝光时间表0])
           else
            seekBar右.text="1/"..tostring(曝光时间表0[#曝光时间表0])
          end
          --绑定监听
          seekBar.setOnSeekBarChangeListener{
            onProgressChanged=function()
              xpcall(function()
                if (当前状态=="曝光时间") then
                  if 曝光时间表0[seekBar.getProgress()+2]==tostring(曝光时间表0[seekBar.getProgress()+2]) then
                    当前曝光时间=tostring(曝光时间表0[seekBar.getProgress()+2])*1000000000
                    --曝光时间当前状态.text="1/"..tostring(四舍五入(1000000000/(seekBar.getProgress()+曝光时间min),0))
                    曝光时间当前状态.text=tostring(曝光时间表0[seekBar.getProgress()+2])
                   else
                    当前曝光时间=1000000000/曝光时间表0[seekBar.getProgress()+2]
                    --曝光时间当前状态.text="1/"..tostring(四舍五入(1000000000/(seekBar.getProgress()+曝光时间min),0))
                    曝光时间当前状态.text="1/"..tostring(曝光时间表0[seekBar.getProgress()+2])
                  end
                  当前参数.text=曝光时间当前状态.text
                  预览2()
                end
              end,function(e)
              end)
            end}
          判断是否隐藏滑动条()
          --控件不可视
          加锁LinearLayout.setVisibility(View.INVISIBLE)
          --控件不可视
          切换自动与手动LinearLayout.setVisibility(View.INVISIBLE)
        end
      end,function(e)
        --控件不可视
        曝光时间标题.setVisibility(View.INVISIBLE)
        --控件不可视
        曝光时间当前状态.setVisibility(View.INVISIBLE)
      end)
      xpcall(function()
        ISO范围 = mCameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_SENSITIVITY_RANGE);
        ISOmax = ISO范围.getUpper();
        ISOmin = ISO范围.getLower();
        --当前ISO=ISOmin
        ISO差=ISOmax-ISOmin
        ISO.onClick=function()
          切换是否手动控制.text="M"
          是否手动控制=true
          当前状态="ISO"
          seekBar.setMax(ISO差)
          seekBar.setProgress(当前ISO-ISOmin)
          当前参数.text=tostring(当前ISO)
          seekBar左.text=tostring(ISOmin)
          seekBar右.text=tostring(ISOmax)
          --绑定监听
          seekBar.setOnSeekBarChangeListener{
            onProgressChanged=function()
              --xpcall(function()
              if (当前状态=="ISO") then
                当前ISO=seekBar.getProgress()+ISOmin
                ISO当前状态.text=tostring(seekBar.getProgress()+ISOmin)
                当前参数.text=ISO当前状态.text
                预览2()
              end
              --[[end,function(e)
              end)]]
            end}
          判断是否隐藏滑动条()
          --控件不可视
          加锁LinearLayout.setVisibility(View.INVISIBLE)
          --控件不可视
          切换自动与手动LinearLayout.setVisibility(View.INVISIBLE)
        end
      end,function(e)
        --控件不可视
        ISO标题.setVisibility(View.INVISIBLE)
        --控件不可视
        ISO当前状态.setVisibility(View.INVISIBLE)
      end)
      曝光补偿.onClick=function()
        当前状态="曝光补偿"
        判断是否隐藏滑动条(true)
        seekBar.setMax(10)
        seekBar.setProgress(当前曝光补偿+5)
        seekBar左.text="-5"
        seekBar右.text="5"
        当前参数.text=曝光补偿当前状态.text
        --绑定监听
        seekBar.setOnSeekBarChangeListener{
          onProgressChanged=function()
            xpcall(function()
              if (当前状态=="曝光补偿") then
                if (是否手动控制) then
                  切换是否手动控制.text="A"
                  是否手动控制=false
                  预览()
                end
                当前曝光补偿=seekBar.getProgress()-5
                曝光补偿当前状态.text=tostring(当前曝光补偿)
                当前参数.text=曝光补偿当前状态.text
                预览2()
              end
            end,function(e)
            end)
          end}
        --控件不可视
        加锁LinearLayout.setVisibility(View.INVISIBLE)
        --控件不可视
        切换自动与手动LinearLayout.setVisibility(View.INVISIBLE)
      end
      xpcall(function()
        焦距.onClick=function()
          当前状态="焦距"
          seekBar.setMax(mCameraCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE)*1000)
          seekBar.setProgress(目前自动对焦值*1000)
          seekBar左.text="0"
          seekBar右.text=tostring(mCameraCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE))
          --绑定监听
          seekBar.setOnSeekBarChangeListener{
            onProgressChanged=function()
              xpcall(function()
                if (当前状态=="焦距") then
                  当前焦距=seekBar.getProgress()/1000
                  焦距当前状态.text=tostring(当前焦距)
                  当前参数.text=焦距当前状态.text
                  预览2()
                end
              end,function(e)
              end)
            end}
          判断是否隐藏滑动条()
          切换至手动对焦()
          if (对焦锁) then
            加锁ImageView.ColorFilter=Color.parseColor(强调色)
           else
            加锁ImageView.ColorFilter=(文字)
          end
          加锁LinearLayout.onClick=function()
            if (对焦锁) then
              对焦锁=(false)
              加锁ImageView.ColorFilter=(文字)
             else
              对焦锁=(true)
              加锁ImageView.ColorFilter=Color.parseColor(强调色)
            end
            预览2()
          end
          --控件可视
          加锁LinearLayout.setVisibility(View.VISIBLE)
          --控件可视
          切换自动与手动LinearLayout.setVisibility(View.VISIBLE)
        end
      end,function(e)
        --控件不可视
        焦距标题.setVisibility(View.INVISIBLE)
        --控件不可视
        焦距当前状态.setVisibility(View.INVISIBLE)
      end)
      --手动对焦值 = mCameraCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE);
      降噪LinearLayout.onClick=function()
        --print(mCameraCharacteristics.get(CameraCharacteristics.SENSOR_MAXANALOG_SENSITIVITY))
        pop=PopupMenu(activity,降噪ImageView)
        menu=pop.Menu
        menu.add("关闭").onMenuItemClick=function(a)
          降噪模式=CaptureRequest.NOISE_REDUCTION_MODE_OFF
          数据列表0.C2降噪模式=降噪模式
          写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
          预览()
        end
        menu.add("小").onMenuItemClick=function(a)
          降噪模式=CaptureRequest.NOISE_REDUCTION_MODE_MINIMAL
          数据列表0.C2降噪模式=降噪模式
          写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
          预览()
        end
        menu.add("高质量").onMenuItemClick=function(a)
          降噪模式=CaptureRequest.NOISE_REDUCTION_MODE_HIGH_QUALITY
          数据列表0.C2降噪模式=降噪模式
          写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
          预览()
        end
        menu.add("快速").onMenuItemClick=function(a)
          降噪模式=CaptureRequest.NOISE_REDUCTION_MODE_FAST
          数据列表0.C2降噪模式=降噪模式
          写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
          预览()
        end
        pop.show()--显示@音六站长～
      end
      是否支持闪光灯 = mCameraCharacteristics.get(CameraCharacteristics.FLASH_INFO_AVAILABLE);
      if (是否支持闪光灯) then
        闪光灯LinearLayout.onClick=function()
          pop=PopupMenu(activity,闪光灯LinearLayout)
          menu=pop.Menu
          menu.add("关闭").onMenuItemClick=function(a)
            mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_ON);
            闪光灯模式=CaptureRequest.FLASH_MODE_OFF
            预览()
            --设置的图片也可以输入路径
            闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_off_black.png"))
          end
          menu.add("打开").onMenuItemClick=function(a)
            mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_ON);
            闪光灯模式=CaptureRequest.FLASH_MODE_SINGLE
            预览()
            --设置的图片也可以输入路径
            闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_on_black.png"))
          end
          menu.add("常亮").onMenuItemClick=function(a)
            mCaptureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_ON);
            闪光灯模式=CaptureRequest.FLASH_MODE_TORCH
            预览()
            --设置的图片也可以输入路径
            闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_on_black.png"))
          end
          pop.show()--显示@音六站长～
        end
       else
        --控件隐藏
        闪光灯LinearLayout.setVisibility(View.GONE)
      end
      streamConfigurationMap = mCameraCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
      --支持的分辨率
      mOutputSizes = streamConfigurationMap.getOutputSizes(ImageFormat.JPEG);
      最高分辨率表=luajava.astable(mOutputSizes)
      table.sort(最高分辨率表,function(a,b)
        return ((a.width*a.height)>(b.width*b.height))
      end)
      mOutputSize =最高分辨率表[1]
      初始化(最高分辨率表)
      降噪模式=数据列表0.C2降噪模式
      格式.Text=数据列表0.C2是否RAW
      xpcall(function()
        --支持的RAW分辨率
        mRAWOutputSizes = streamConfigurationMap.getOutputSizes(ImageFormat.RAW_SENSOR);
        mRAWOutputSize =luajava.astable(mRAWOutputSizes)[1]
      end,function(e)
        格式.Text=string.upper(数据列表0.图像格式)
        --控件不可视
        格式.setVisibility(View.GONE)
        是否支持RAW=false
      end)
      --print( mCameraCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE))
      Cameramanager.openCamera(mCameraid,Statecallback,nil);
    end
    预览(true)
  end,
  onSurfaceTextureDestroyed=function()
    Cameradevice=mCameradevice
    if (Cameradevice==nil)==false then
      Cameradevice.close()
      Cameradevice=nil
    end
  end,
}
function 波纹2(颜色)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackground}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  --  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
  return Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
end
--相册.Background=波纹2(文字);
波纹({最新照片父布局,
  设置LinearLayout,
  滤镜LinearLayout,
  闪光灯LinearLayout,
  工具箱LinearLayout,
  格式,
  降噪LinearLayout,
  切换摄像头LinearLayout,
  曝光时间,
  ISO,
  曝光补偿,
  焦距,
  切换是否手动控制,
  加锁LinearLayout,
},"方",文字)
波纹({tv},"方",0xFF000000)

import "java.io.File"

catalog=File("sdcard/DCIM/Camera/")
name=".jpg"
find(catalog,name,iD)
--隐藏状态栏
activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
设置LinearLayout.onClick=function()
  设置()
end
控件边框(对焦点,dp2px(36),"#40ffffff","#ffffffff",dp2px(4))
控件边框(菜单卡片,dp2px(8),"#a6000000","#a6ffffff",dp2px(1))
控件边框(tv0,dp2px(40),"#ffffffff","#80FFFFFF",dp2px(10))
控件边框(拍照和录像LinearLayout,dp2px(4),"#26FFFFFF","#26FFFFFF",0)
控件边框(拍照LinearLayout2,dp2px(4),"#26FFFFFF","#26FFFFFF",0)
控件边框(录像LinearLayout2,dp2px(4),"#26FFFFFF","#26FFFFFF",0)
控件边框(录像停止按钮,dp2px(18),"#ffffffff","#ffffffff",0)
控件边框(切换自动与手动LinearLayout,dp2px(18),"#26FFFFFF","#26FFFFFF",0)
控件边框(自动LinearLayout2,dp2px(18),"#26FFFFFF","#26FFFFFF",0)
控件边框(手动LinearLayout2,dp2px(18),"#26FFFFFF","#26FFFFFF",0)
--控件不可视
录像停止按钮.setVisibility(View.INVISIBLE)

import "android.hardware.SensorManager"
import "android.hardware.SensorEventListener"
import "android.hardware.Sensor"
function onResume()
  if Cameramanager then
    预览(true)
  end
  传感器 = activity.getSystemService(Context.SENSOR_SERVICE)

  local 重力传感器 = 传感器.getDefaultSensor(Sensor.TYPE_GRAVITY)
  sel=SensorEventListener({
    onSensorChanged=function(event)
      重力 = event.values[0]
      if 重力>5 then
        角度=(90)
       else
        角度=(0)
      end
      最新照片CardView.setRotation(角度);
      菜单卡片父布局.setRotation(角度);
      菜单卡片.setRotation(角度);
      设置LinearLayout.setRotation(角度);
      滤镜LinearLayout.setRotation(角度);
      闪光灯LinearLayout.setRotation(角度);
      工具箱LinearLayout.setRotation(角度);
      拍照ImageView.setRotation(角度);
      录像mageView.setRotation(角度);
      切换摄像头LinearLayout.setRotation(角度);
      降噪LinearLayout.setRotation(角度);
      曝光时间.setRotation(角度);
      ISO.setRotation(角度);
      曝光补偿.setRotation(角度);
      切换是否手动控制.setRotation(角度);
      自动TextView.setRotation(角度);
      手动TextView.setRotation(角度);
      加锁ImageView.setRotation(角度);
      焦距.setRotation(角度);
      seekBar左.setRotation(角度);
      seekBar右.setRotation(角度);
    end,nil})
  传感器.registerListener(sel, 重力传感器, SensorManager.SENSOR_DELAY_UI)
end
function onPause()
  --activity.finish()
  --注销所有传感器的监听
  传感器.unregisterListener(sel);
end
拖动条颜色(seekBar,Color.parseColor(强调色))
--[[切换摄像头LinearLayout.onClick=function()
  if 摄像头==CameraInfo.CAMERA_FACING_BACK then
holder=sureface.getHolder()
holder.addCallback(callback(CameraInfo.CAMERA_FACING_FRONT))
holder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
print(摄像头)
    else
holder=sureface.getHolder()
holder.addCallback(callback(CameraInfo.CAMERA_FACING_BACK))
holder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
print(摄像头)
    end
  end
]]
AutoSetToolTip(设置LinearLayout,"设置")
AutoSetToolTip(滤镜LinearLayout,"色彩")
AutoSetToolTip(闪光灯LinearLayout,"闪光灯")
AutoSetToolTip(工具箱LinearLayout,"工具箱")
AutoSetToolTip(切换摄像头LinearLayout,"切换摄像头")
--AutoSetToolTip(加锁LinearLayout,"加锁")
AutoSetToolTip(tv,"拍照")
AutoSetToolTip(最新照片父布局,"最新照片")

--[[xpcall(function()
end,function(e)
  --先导入包
  import "android.content.*"
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(e)
end)]]
--首先要导入包
import "android.graphics.*"
--加粗
格式.getPaint().setFakeBoldText(true)
--加粗
自动TextView.getPaint().setFakeBoldText(true)
--加粗
手动TextView.getPaint().setFakeBoldText(true)
格式.onClick=function()
  if 格式.Text=="RAW" then
    格式.Text="RAW+"..string.upper(数据列表0.图像格式)
   elseif 格式.Text=="RAW+"..string.upper(数据列表0.图像格式) then
    格式.Text=string.upper(数据列表0.图像格式)
   elseif 格式.Text==string.upper(数据列表0.图像格式) then
    格式.Text="RAW"
   else
    格式.Text="RAW"
  end
  数据列表0.C2是否RAW=格式.Text
  写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
end

function 切换菜单卡片状态()
  if (菜单卡片.Visibility==View.INVISIBLE) then
    --控件可视
    菜单卡片.setVisibility(View.VISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    --变焦背景.startAnimation(透明动画)

    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    菜单卡片父布局.startAnimation(透明动画)
   else
    --控件不可视
    菜单卡片.setVisibility(View.INVISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    --变焦背景.startAnimation(透明动画)
  end
end
支持的滤镜效果={}
支持的滤镜效果["OFF"]=CaptureRequest.CONTROL_EFFECT_MODE_OFF
支持的滤镜效果["AQUA"]=CaptureRequest.CONTROL_EFFECT_MODE_AQUA
支持的滤镜效果["BLACKBOARD"]=CaptureRequest.CONTROL_EFFECT_MODE_BLACKBOARD
支持的滤镜效果["MONO"]=CaptureRequest.CONTROL_EFFECT_MODE_MONO
支持的滤镜效果["NEGATIVE"]=CaptureRequest.CONTROL_EFFECT_MODE_NEGATIVE
支持的滤镜效果["POSTERIZE"]=CaptureRequest.CONTROL_EFFECT_MODE_POSTERIZE
支持的滤镜效果["SEPIA"]=CaptureRequest.CONTROL_EFFECT_MODE_SEPIA
支持的滤镜效果["SOLARIZE"]=CaptureRequest.CONTROL_EFFECT_MODE_SOLARIZE
支持的滤镜效果["WHITEBOARD"]=CaptureRequest.CONTROL_EFFECT_MODE_WHITEBOARD
滤镜onClick=function(v)
  当前滤镜=(支持的滤镜效果[v.text])--设置滤镜效果
  预览()
end
qwerty=0
for d,内容 in pairs(支持的滤镜效果) do
  if (qwerty==0) then
    滤镜父布局.addView(loadlayout(获取工具菜单布局()))
  end
  qwerty=qwerty+1
  if (qwerty==3) then
    qwerty=0
    项目三文字.text=d
    项目三文字.onClick=滤镜onClick
    项目三文字.Background=波纹2(文字);
   elseif (qwerty==2) then
    项目二文字.text=d
    项目二文字.onClick=滤镜onClick
    项目二文字.Background=波纹2(文字);
   elseif (qwerty==1) then
    项目一文字.text=d
    项目一文字.onClick=滤镜onClick
    项目一文字.Background=波纹2(文字);
   elseif (qwerty==0) then
    -- 工具菜单.addView(loadlayout(工具菜单布局))
  end
end

滤镜LinearLayout.onClick=function()
  切换菜单卡片状态()
  --控件可视
  滤镜父布局.setVisibility(View.VISIBLE)
  --控件隐藏
  工具箱父布局.setVisibility(View.GONE)
end

工具onClick=function(v)
  当前模式=v.text
  --[[for d,内容 in pairs(工具列表) do
    if (内容==v.text) then
      工具ID列表[内容].setBackgroundColor(强调色2)
     else
      工具ID列表[内容].setBackgroundColor(0)
    end
  end]]
  if (v.text=="方形拍照") then
    --设置高度
    linearParams = 内背景.getLayoutParams()
    linearParams.height =activity.width
    内背景.setLayoutParams(linearParams)
   elseif 当前模式=="双重曝光" or 当前模式=="伪长曝光" then
    格式.Text=string.upper(数据列表0.图像格式)
   else
    --设置高度
    linearParams = 内背景.getLayoutParams()
    linearParams.height =activity.width/3*4
    内背景.setLayoutParams(linearParams)
  end
end
工具列表={"普通拍照","定时拍照","连续拍照","包围曝光","方形拍照","伪长曝光","双重曝光","HDR"}
qwerty=0
if (是否第1次加载相机=="是") then
  工具ID列表={}
  for d,内容 in pairs(工具列表) do
    if (qwerty==0) then
      工具箱父布局.addView(loadlayout(获取工具菜单布局()))
    end
    qwerty=qwerty+1
    内容2=内容
    if (qwerty==3) then
      qwerty=0
      项目三文字.text=内容
      项目三文字.onClick=工具onClick
      项目三文字.Background=波纹2(文字);
      工具ID列表[内容]=项目三背景
     elseif (qwerty==2) then
      项目二文字.text=内容
      项目二文字.onClick=工具onClick
      项目二文字.Background=波纹2(文字);
      工具ID列表[内容]=项目三背景
     elseif (qwerty==1) then
      项目一文字.text=内容
      项目一文字.onClick=工具onClick
      项目一文字.Background=波纹2(文字);
      工具ID列表[内容]=项目三背景
     elseif (qwerty==0) then
      -- 工具菜单.addView(loadlayout(工具菜单布局))
    end
  end
end
工具箱LinearLayout.onClick=function()
  切换菜单卡片状态()
  --控件隐藏
  滤镜父布局.setVisibility(View.GONE)
  --控件可视
  工具箱父布局.setVisibility(View.VISIBLE)
end
切换摄像头LinearLayout.onClick=function()
  Cameradevice=mCameradevice
  if (Cameradevice==nil)==false then
    Cameradevice.close()
    Cameradevice=nil
  end
  if (是否使用前置摄像头) then
    预览(false)
    是否使用前置摄像头=false
   else
    预览(true)
    是否使用前置摄像头=true
  end
end

--控件可视
拍照LinearLayout2.setVisibility(View.VISIBLE)
--控件不可视
录像LinearLayout2.setVisibility(View.INVISIBLE)
拍照LinearLayout.onClick=function()
  if (拍照LinearLayout2.Visibility==View.INVISIBLE) then
    --控件可视
    拍照LinearLayout2.setVisibility(View.VISIBLE)
    --控件不可视
    录像LinearLayout2.setVisibility(View.INVISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    拍照LinearLayout2父布局.startAnimation(透明动画)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    录像LinearLayout2父布局.startAnimation(透明动画)
  end
  当前模式="普通拍照"
  --震动()
end
录像LinearLayout.onClick=function()
  if (录像LinearLayout2.Visibility==View.INVISIBLE) then
    --控件可视
    录像LinearLayout2.setVisibility(View.VISIBLE)
    --控件不可视
    拍照LinearLayout2.setVisibility(View.INVISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    录像LinearLayout2父布局.startAnimation(透明动画)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    拍照LinearLayout2父布局.startAnimation(透明动画)
  end
  当前模式="普通录像"
  --震动()
end
--加粗
切换是否手动控制.getPaint().setFakeBoldText(true)
切换是否手动控制.onClick=function()
  if (切换是否手动控制.text=="A") then
    切换是否手动控制.text="M"
    是否手动控制=true
   elseif (切换是否手动控制.text=="M") then
    切换是否手动控制.text="A"
    是否手动控制=false
  end
  预览()
end

--控件可视
自动LinearLayout2.setVisibility(View.VISIBLE)
--控件不可视
手动LinearLayout2.setVisibility(View.INVISIBLE)
function 切换至自动对焦()
  if (自动LinearLayout2.Visibility==View.INVISIBLE) then
    --控件可视
    自动LinearLayout2.setVisibility(View.VISIBLE)
    --控件不可视
    手动LinearLayout2.setVisibility(View.INVISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    自动LinearLayout2父布局.startAnimation(透明动画)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    手动LinearLayout2父布局.startAnimation(透明动画)
  end
  是否手动对焦=false
  预览2()
  --震动()
end
自动LinearLayout.onClick=function()
  切换至自动对焦()
end
function 切换至手动对焦()
  if (手动LinearLayout2.Visibility==View.INVISIBLE) then
    --控件可视
    手动LinearLayout2.setVisibility(View.VISIBLE)
    --控件不可视
    自动LinearLayout2.setVisibility(View.INVISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    手动LinearLayout2父布局.startAnimation(透明动画)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    自动LinearLayout2父布局.startAnimation(透明动画)
  end
  是否手动对焦=true
  预览2()
end
手动LinearLayout.onClick=function()
  切换至手动对焦()
  --震动()
end