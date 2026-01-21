require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "mod"
import "android.graphics.Color"
import "android.graphics.Matrix"
import "android.graphics.Paint"
import "android.graphics.Canvas"
import "android.R"
import "android.graphics.BitmapFactory"
import "android.graphics.Bitmap"
import "android.hardware.Camera"
import "android.hardware.Camera$CameraInfo"
--作者qwe12345678
当前状态=""
当前模式="普通拍照"
是否c2="否"
是否第1次加载相机="是"
重力 = 0
if 文件是否存在("/sdcard/Android/data/"..activity.getPackageName().."/data.aly") then
  数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
  if 数据列表0.是否启用C2 then
    activity.newActivity('main2')
    activity.finish()
  end
end
摄像头=...
摄像头=摄像头 or CameraInfo.CAMERA_FACING_BACK
工具菜单布局={
  LinearLayout;
  layout_width="fill";
  orientation="horizontal";
  {
    LinearLayout;
    layout_width="fill";
    orientation="horizontal";
    layout_weight="1";
    {
      TextView;
      padding="8dp",
      layout_height="fill",
      textColor=文字;
      layout_gravity="center";
      gravity="center";
      layout_width="fill",--布局宽度
      id="项目一文字";
      textSize="14sp";
    };
  };
  {
    LinearLayout;
    layout_width="fill";
    orientation="horizontal";
    layout_weight="1";
    {
      TextView;
      padding="8dp",
      layout_height="fill",
      textColor=文字;
      layout_gravity="center";
      gravity="center";
      layout_width="fill",--布局宽度
      id="项目二文字";
      textSize="14sp";
    };
  };
  {
    LinearLayout;
    layout_width="fill";
    orientation="horizontal";
    layout_weight="1";
    {
      TextView;
      padding="8dp",
      layout_height="fill",
      textColor=文字;
      layout_gravity="center";
      gravity="center";
      layout_width="fill",--布局宽度
      id="项目三文字";
      textSize="14sp";
    };
  };
};

import "layout"
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
activity.setTheme(android.R.style.Theme_Material)
activity.ActionBar.hide()
activity.setContentView(loadlayout(layout))

import "android.graphics.*"
import "java.io.*"
import "android.content.*"
import "android.text.format.DateFormat"

--activity.setTitle('AndroLua')
function 判断是否隐藏滑动条()
  if (seekBar背景.Visibility==View.INVISIBLE) then
    --控件可视
    seekBar背景.setVisibility(View.VISIBLE)
    task(96,function()
      --控件可视
      底部菜单.setVisibility(View.VISIBLE)
    end)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    底部菜单2.startAnimation(透明动画)
    import"android.view.animation.TranslateAnimation"
    --上升动画
    --相关参数，请自行手册查询
    --定义动画,500为上升高度
    yuxuandh3=TranslateAnimation(0,0,activity.height,0)
    --动画时间，也就是上升动画的快慢
    yuxuandh3.setDuration(300)
    --动画开始执行
    seekBar背景父布局.startAnimation(yuxuandh3);
    seekBar背景父布局.BackgroundColor=0x60000000
   else
    --控件不可视
    seekBar背景.setVisibility(View.INVISIBLE)
    task(96,function()
    --控件不可视
    底部菜单.setVisibility(View.INVISIBLE)
    end)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    底部菜单2.startAnimation(透明动画)
    --上升动画
    --相关参数，请自行手册查询
    --定义动画,500为上升高度
    yuxuandh3=TranslateAnimation(0,0,0,activity.height)
    --动画时间，也就是上升动画的快慢
    yuxuandh3.setDuration(300)
    --动画开始执行
    seekBar背景父布局.startAnimation(yuxuandh3);
    seekBar背景父布局.BackgroundColor=0x00000000
  end
end

import "paizhao"

--控件不可视
seekBar背景.setVisibility(View.INVISIBLE)
--控件不可视
菜单卡片.setVisibility(View.INVISIBLE)
--控件不可视
对焦点.setVisibility(View.INVISIBLE)
--控件不可视
底部菜单.setVisibility(View.INVISIBLE)
autoFocus2=Camera.AutoFocusCallback{
  onAutoFocus=function(success, camera)
    --success为true表示对焦成功
    if (success) then
      if (camera ~= nil) then
        import "android.content.Context"
        --导入包
        vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
        vibrator.vibrate( long{0,18} ,-1)
        --{等待时间,振动时间,等待时间,振动时间,…}
        --{0,1000,500,1000,500,1000}
        --别忘了申明权限
      end
    end
  end
}


内背景.onTouch=function(v,e)
  xpcall(function()
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
  mCamera.autoFocus(autoFocus2)
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
end,function(e)
  end)
end
function callback(摄像头)
  摄像头=摄像头
  callbackw=SurfaceHolder_Callback{
    surfaceChanged=function(holder,format,width,height)
      --开始预览
      parameters = mCamera.getParameters();
      --dump string2tab
      width表={}
      height表={}
      视频分辨率表=(luajava.astable(parameters.getSupportedVideoSizes()))
      最高分辨率表=(luajava.astable(parameters.getSupportedPictureSizes()))
      table.sort(视频分辨率表,function(a,b)
        return ((a.width*a.height)>(b.width*b.height))
      end)
      table.sort(最高分辨率表,function(a,b)
        return ((a.width*a.height)>(b.width*b.height))
      end)
      --print(最高分辨率表[1])
      import("android.media.MediaRecorder")
      支持的视频大小表=(luajava.astable(parameters.getSupportedVideoSizes()))
      table.sort(支持的视频大小表,function(a,b)
        return ((a.width)>(b.width))
      end)
      --最高分辨率=最高分辨率表[#最高分辨率表]
      初始化(最高分辨率表,视频分辨率表)

      --数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
      xpcall(function()
        if 数据列表0.零延时拍照前 then
          parameters.setZSLMode("on")
         else
          parameters.setZSLMode("off")
        end
      end,function(e)
      end)
      --parameters.setaperture(1)

      --设置格式
      parameters.setPictureFormat(PixelFormat.JPEG);
      --设置预览大小，这里代码的测试机是Milsstone所以以前设置的是854x480
      parameters.setPreviewSize(1440,1080);
      if 摄像头==CameraInfo.CAMERA_FACING_BACK then
        --设置拍照时的图片大小
        parameters.setPictureSize(数据列表0.图像分辨率width,数据列表0.图像分辨率height)
        xpcall(function()
          --设置自动对焦
          parameters.setFocusMode("auto")--infinity macro continuous-video continuous-picture manual
        end,function(e)
        end)
       else
        --设置拍照时的图片大小
        parameters.setPictureSize(最高分辨率表[1].width,最高分辨率表[1].height)
      end
      xpcall(function()
        当前支持的防牛顿环配置=parameters.getSupportedAntibanding()--获取当前支持的防牛顿环配置
        当前支持的防牛顿环配置=luajava.astable(当前支持的防牛顿环配置)
        parameters.setAntibanding(数据列表0.防牛顿环配置)
      end,function(e)
      end)
      --parameters.setExposureCompensation(2)
      xpcall(function()
        当前感光度=parameters.getISOSpeed()--获取当前感光度
        parameters.setISOSpeed("auto")--设置感光度
        当前模式支持的感光度=parameters.getSupportedISOSpeed()--获取当前模式支持的感光度
        --当前模式支持的感光度=(string2tab(dump(当前模式支持的感光度)))
        当前模式支持的感光度=luajava.astable(当前模式支持的感光度)
        ISO当前状态.text=tostring(当前感光度)
        --控件不可视
        加锁LinearLayout.setVisibility(View.INVISIBLE)
        ISO.onClick=function()
          当前状态="ISO"
          seekBar.setMax(#当前模式支持的感光度)
          seekBar.setProgress(0)
          当前参数.text=tostring(parameters.ISOSpeed)
          seekBar左.text=tostring(当前模式支持的感光度[1])
          seekBar右.text=tostring(当前模式支持的感光度[#当前模式支持的感光度])
          --绑定监听
          seekBar.setOnSeekBarChangeListener{
            onProgressChanged=function()
              xpcall(function()
                if (当前状态=="ISO") then
                  parameters = mCamera.getParameters();
                  parameters.setISOSpeed(当前模式支持的感光度[seekBar.getProgress()])--设置感光度
                  mCamera.setParameters(parameters);
                  ISO当前状态.text=tostring(parameters.ISOSpeed)
                  当前参数.text=tostring(parameters.ISOSpeed)
                end
              end,function(e)
              end)
            end}
          判断是否隐藏滑动条()
        end
      end,function(e)
        --控件不可视
        ISO标题.setVisibility(View.INVISIBLE)
        --控件不可视
        ISO当前状态.setVisibility(View.INVISIBLE)
      end)
      xpcall(function()
        parameters.setExposureCompensation(0)
        曝光补偿.onClick=function()
          当前状态="曝光补偿"
          seekBar.setMax(10)
          seekBar.setProgress(5)
          seekBar左.text="-5"
          seekBar右.text="5"
          当前参数.text=tostring(parameters.ExposureCompensation)
          --绑定监听
          seekBar.setOnSeekBarChangeListener{
            onProgressChanged=function()
              xpcall(function()
                if (当前状态=="曝光补偿") then
                  parameters = mCamera.getParameters();
                  parameters.setExposureCompensation(seekBar.getProgress()-5)--设置曝光补偿
                  mCamera.setParameters(parameters);
                  曝光补偿当前状态.text=tostring(seekBar.getProgress()-5)
                  当前参数.text=tostring(parameters.ExposureCompensation)
                end
              end,function(e)
              end)
            end}
          --控件可视
          加锁LinearLayout.setVisibility(View.VISIBLE)
          parameters = mCamera.getParameters();
          if (parameters.AutoExposureLock) then
            加锁ImageView.ColorFilter=Color.parseColor(强调色)
           else
            加锁ImageView.ColorFilter=(文字)
          end
          mCamera.setParameters(parameters);
          加锁LinearLayout.onClick=function()
            parameters = mCamera.getParameters();
            if (parameters.AutoExposureLock) then
              parameters.setAutoExposureLock(false)
              加锁ImageView.ColorFilter=(文字)
             else
              parameters.setAutoExposureLock(true)
              加锁ImageView.ColorFilter=Color.parseColor(强调色)
            end
            mCamera.setParameters(parameters);
          end
          判断是否隐藏滑动条()
        end
      end,function(e)
        --控件不可视
        曝光补偿标题.setVisibility(View.INVISIBLE)
        --控件不可视
        曝光补偿当前状态.setVisibility(View.INVISIBLE)
      end)
      xpcall(function()
        当前支持的白平衡值=parameters.getSupportedWhiteBalance()--获取当前支持的白平衡值
        当前支持的白平衡值=luajava.astable(当前支持的白平衡值)
        当前白平衡值=parameters.getWhiteBalance()--获取当前白平衡值
        白平衡当前状态.text=当前白平衡值
        白平衡.onClick=function()
          -- parameters.setDenoise("DENOISE_OFF")
          当前状态="白平衡"
          seekBar.setMax(#当前支持的白平衡值)
          seekBar.setProgress(0)
          seekBar左.text=""
          seekBar右.text=""
          当前参数.text=tostring(parameters.WhiteBalance)
          --绑定监听
          seekBar.setOnSeekBarChangeListener{
            onProgressChanged=function()
              xpcall(function()
                if (当前状态=="白平衡") then
                  parameters = mCamera.getParameters();
                  parameters.setWhiteBalance(当前支持的白平衡值[seekBar.getProgress()])--设置感光度
                  mCamera.setParameters(parameters);
                  白平衡当前状态.text=tostring(当前支持的白平衡值[seekBar.getProgress()])
                  当前参数.text=tostring(parameters.WhiteBalance)
                end
              end,function(e)
              end)
            end}
          判断是否隐藏滑动条()
          --控件可视
          加锁LinearLayout.setVisibility(View.VISIBLE)
          parameters = mCamera.getParameters();
          if (parameters.AutoWhiteBalanceLock) then
            加锁ImageView.ColorFilter=Color.parseColor(强调色)
           else
            加锁ImageView.ColorFilter=(文字)
          end
          mCamera.setParameters(parameters);
          加锁LinearLayout.onClick=function()
            parameters = mCamera.getParameters();
            if (parameters.AutoWhiteBalanceLock) then
              parameters.setAutoWhiteBalanceLock(false)
              加锁ImageView.ColorFilter=(文字)
             else
              parameters.setAutoWhiteBalanceLock(true)
              加锁ImageView.ColorFilter=Color.parseColor(强调色)
            end
            mCamera.setParameters(parameters);
          end
        end
      end,function(e)
        --控件不可视
        白平衡标题.setVisibility(View.INVISIBLE)
        --控件不可视
        白平衡当前状态.setVisibility(View.INVISIBLE)
      end)
      xpcall(function()
        当前支持的对焦模式=parameters.getSupportedFocusModes()--获取当前支持的白平衡值
        当前支持的对焦模式=luajava.astable(当前支持的对焦模式)
        当前对焦模式=parameters.getFocusMode()--获取当前白平衡值
        对焦模式当前状态.text=当前对焦模式
        对焦模式.onClick=function()
          --print(parameters.getSupportedAntibanding())
          -- parameters.setDenoise("DENOISE_OFF")
          当前状态="对焦模式"
          seekBar.setMax(#当前支持的对焦模式)
          seekBar.setProgress(0)
          seekBar左.text=""
          seekBar右.text=""
          当前参数.text=tostring(parameters.FocusMode)
          --绑定监听
          seekBar.setOnSeekBarChangeListener{
            onProgressChanged=function()
              xpcall(function()
                if (当前状态=="对焦模式") then
                  parameters = mCamera.getParameters();
                  parameters.setFocusMode(当前支持的对焦模式[seekBar.getProgress()])--设置感光度
                  mCamera.setParameters(parameters);
                  对焦模式当前状态.text=tostring(当前支持的对焦模式[seekBar.getProgress()])
                  当前参数.text=tostring(parameters.FocusMode)
                end
              end,function(e)
              end)
            end}
          判断是否隐藏滑动条()
          --控件不可视
          加锁LinearLayout.setVisibility(View.INVISIBLE)
          --[[ parameters = mCamera.getParameters();
         if (parameters.FocusLock) then
            加锁ImageView.ColorFilter=(文字)
           else
            加锁ImageView.ColorFilter=Color.parseColor(强调色)
          end
          mCamera.setParameters(parameters);
          加锁LinearLayout.onClick=function()
            parameters = mCamera.getParameters();
            if (parameters.FocusLock) then
              parameters.setFocusLock(false)
              加锁ImageView.ColorFilter=(文字)
             else
              parameters.setFocusLock(true)
              加锁ImageView.ColorFilter=Color.parseColor(强调色)
            end
            mCamera.setParameters(parameters);
          end]]
        end
      end,function(e)
        --控件不可视
        对焦模式标题.setVisibility(View.INVISIBLE)
        --控件不可视
        对焦模式当前状态.setVisibility(View.INVISIBLE)
      end)
      --
      xpcall(function()
        变焦seekBar.setMax(parameters.getMaxZoom())
        变焦seekBar.setProgress(0)
        变焦倍率标题.text=tostring(parameters.getZoom())
        变焦List=parameters.getZoomRatios()
        --print(变焦List)
        --绑定监听
        变焦seekBar.setOnSeekBarChangeListener{
          onProgressChanged=function()
            parameters = mCamera.getParameters();
            parameters.setZoom(变焦seekBar.getProgress())
            mCamera.setParameters(parameters);
            变焦倍率标题.text=tostring(变焦seekBar.getProgress())
          end}
      end,function(e)
        --控件不可视
        变焦seekBar.setVisibility(View.INVISIBLE)
        --控件不可视
        变焦倍率标题.setVisibility(View.INVISIBLE)
      end)
      xpcall(function()
        parameters.setFlashMode("off")
        闪光灯LinearLayout.onClick=function()
          pop=PopupMenu(activity,闪光灯LinearLayout)
          menu=pop.Menu
          menu.add("关闭").onMenuItemClick=function(a)
            parameters = mCamera.getParameters();
            parameters.setFlashMode("off")
            mCamera.setParameters(parameters);
            --设置的图片也可以输入路径
            闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_off_black.png"))
          end
          menu.add("auto").onMenuItemClick=function(a)
            parameters = mCamera.getParameters();
            parameters.setFlashMode("auto")
            mCamera.setParameters(parameters);
            --设置的图片也可以输入路径
            闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_auto_black.png"))
          end
          menu.add("打开").onMenuItemClick=function(a)
            parameters = mCamera.getParameters();
            parameters.setFlashMode("on")
            mCamera.setParameters(parameters);
            --print(mCamera.getParameters().FlashMode)
            --设置的图片也可以输入路径
            闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_on_black.png"))
          end
          --[[menu.add("红眼").onMenuItemClick=function(a)
          parameters = mCamera.getParameters();
          parameters.setFlashMode("FLASH_MODE_RED_EYE")
          mCamera.setParameters(parameters);
          --设置的图片也可以输入路径
          闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_on_black.png"))
        end]]
          menu.add("常亮").onMenuItemClick=function(a)
            parameters = mCamera.getParameters();
            parameters.setFlashMode("torch")
            mCamera.setParameters(parameters);
            --设置的图片也可以输入路径
            闪光灯ImageView.setImageBitmap(loadbitmap("png/flash_on_black.png"))
          end
          pop.show()--显示@音六站长～
        end
      end,function(e)
        --控件不可视
        闪光灯LinearLayout.setVisibility(View.INVISIBLE)
      end)
      工具onClick=function(v)
        当前模式=v.text
        if (v.text=="方形拍照") then
          --设置高度
          linearParams = 内背景.getLayoutParams()
          linearParams.height =activity.width
          内背景.setLayoutParams(linearParams)
         else
          --设置高度
          linearParams = 内背景.getLayoutParams()
          linearParams.height =activity.width/3*4
          内背景.setLayoutParams(linearParams)
        end
      end
      工具列表={"普通拍照","定时拍照","连续拍照","包围曝光","包围白平衡","方形拍照","伪长曝光","双重曝光","HDR"}
      qwerty=0
      if (是否第1次加载相机=="是") then
        for d,内容 in pairs(工具列表) do
          if (qwerty==0) then
            工具箱父布局.addView(loadlayout(工具菜单布局))
          end
          qwerty=qwerty+1
          if (qwerty==3) then
            qwerty=0
            项目三文字.text=内容
            项目三文字.onClick=工具onClick
            项目三文字.Background=波纹2(文字);
           elseif (qwerty==2) then
            项目二文字.text=内容
            项目二文字.onClick=工具onClick
            项目二文字.Background=波纹2(文字);
           elseif (qwerty==1) then
            项目一文字.text=内容
            项目一文字.onClick=工具onClick
            项目一文字.Background=波纹2(文字);
           elseif (qwerty==0) then
            -- 工具菜单.addView(loadlayout(工具菜单布局))
          end
        end
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
          变焦背景.startAnimation(透明动画)

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
          变焦背景.startAnimation(透明动画)
        end
      end
      工具箱LinearLayout.onClick=function()
        切换菜单卡片状态()
        --控件隐藏
        滤镜父布局.setVisibility(View.GONE)
        --控件可视
        场景模式父布局.setVisibility(View.VISIBLE)
        --控件可视
        工具箱父布局.setVisibility(View.VISIBLE)
      end
      xpcall(function()
        支持的滤镜效果=parameters.getSupportedColorEffects()--获取支持的滤镜效果
        支持的滤镜效果=luajava.astable(支持的滤镜效果)
        --print(parameters.getSupportedSceneModes())
        if (是否第1次加载相机=="是") then
          滤镜onClick=function(v)
            parameters = mCamera.getParameters();
            parameters.setColorEffect(v.text)--设置滤镜效果
            mCamera.setParameters(parameters);
          end
          qwerty=0
          for d,内容 in pairs(支持的滤镜效果) do
            if (qwerty==0) then
              滤镜父布局.addView(loadlayout(工具菜单布局))
            end
            qwerty=qwerty+1
            if (qwerty==3) then
              qwerty=0
              项目三文字.text=内容
              项目三文字.onClick=滤镜onClick
              项目三文字.Background=波纹2(文字);
             elseif (qwerty==2) then
              项目二文字.text=内容
              项目二文字.onClick=滤镜onClick
              项目二文字.Background=波纹2(文字);
             elseif (qwerty==1) then
              项目一文字.text=内容
              项目一文字.onClick=滤镜onClick
              项目一文字.Background=波纹2(文字);
             elseif (qwerty==0) then
              -- 工具菜单.addView(loadlayout(工具菜单布局))
            end
          end
        end
        滤镜LinearLayout.onClick=function()
          切换菜单卡片状态()
          --控件可视
          滤镜父布局.setVisibility(View.VISIBLE)
          --控件隐藏
          场景模式父布局.setVisibility(View.GONE)
          --控件隐藏
          工具箱父布局.setVisibility(View.GONE)
        end
      end,function(e)
        --控件不可视
        滤镜LinearLayout.setVisibility(View.GONE)
        --控件不可视
        滤镜父布局.setVisibility(View.GONE)
      end)
      xpcall(function()
        支持的情景模式列表=parameters.getSupportedSceneModes()--获取支持的情景模式列表
        支持的情景模式列表=luajava.astable(支持的情景模式列表)
        --print(parameters.getSupportedSceneModes())
        if (是否第1次加载相机=="是") then
          场景模式onClick=function(v)
            parameters = mCamera.getParameters();
            parameters.setSceneMode(v.text)--设置情景模式
            mCamera.setParameters(parameters);
          end
          qwerty=0
          for d,内容 in pairs(支持的情景模式列表) do
            if (qwerty==0) then
              场景模式父布局.addView(loadlayout(工具菜单布局))
            end
            qwerty=qwerty+1
            if (qwerty==3) then
              qwerty=0
              项目三文字.text=内容
              项目三文字.onClick=场景模式onClick
              项目三文字.Background=波纹2(文字);
             elseif (qwerty==2) then
              项目二文字.text=内容
              项目二文字.onClick=场景模式onClick
              项目二文字.Background=波纹2(文字);
             elseif (qwerty==1) then
              项目一文字.text=内容
              项目一文字.onClick=场景模式onClick
              项目一文字.Background=波纹2(文字);
             elseif (qwerty==0) then
              -- 工具菜单.addView(loadlayout(工具菜单布局))
            end
          end
        end
      end,function(e)
        --控件不可视
        场景模式父布局.setVisibility(View.GONE)
      end)
      是否第1次加载相机="否"
      mCamera.setDisplayOrientation(90)
      --print(parameters.flatten())
      --设置图片保存时的分辨率大小
      --parameters.setPictureSize(1600, 1200);
      --给相机对象设置刚才设定的参数
      mCamera.setParameters(parameters);
      mCamera.startPreview();
      xpcall(function()
        mCamera.autoFocus(autoFocus2)
      end,function(e)
        --print("gg")
      end)
    end,
    surfaceCreated=function(holder)
      --当预览视图创建的时候开启相机
      --[[CameraInfo.CAMERA_FACING_BACK 后摄像头
        CameraInfo.CAMERA_FACING_FRONT  前摄像头]]
      mCamera = Camera.open(摄像头);
      --设置预览
      mCamera.setPreviewDisplay(holder);
    end,
    surfaceDestroyed=function(holder)
      mCamera.stopPreview();
      --释放相机资源并置空
      mCamera.release();
      mCamera = nil;
      --传感器.unregisterListener()
    end
  }
  return callbackw
end
holder=sureface.getHolder()
holder.addCallback(callback(摄像头))
holder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);


波纹({曝光补偿,
  ISO,
  白平衡,
  最新照片父布局,
  设置LinearLayout,
  滤镜LinearLayout,
  闪光灯LinearLayout,
  工具箱LinearLayout,
  加锁LinearLayout,
  对焦模式,
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
--控件不可视
录像停止按钮.setVisibility(View.INVISIBLE)

import "android.hardware.SensorManager"
import "android.hardware.SensorEventListener"
import "android.hardware.Sensor"
function onResume()
传感器 = activity.getSystemService(Context.SENSOR_SERVICE)

local 重力传感器 = 传感器.getDefaultSensor(Sensor.TYPE_GRAVITY)
sel=SensorEventListener({
  onSensorChanged=function(event)
    重力 = event.values[0]
    if mCamera then
      if 重力>5 then
        角度=(90)
        parameters = mCamera.getParameters();
        parameters.setRotation(0);
        mCamera.setParameters(parameters);
       else
        角度=(0)
        parameters = mCamera.getParameters();
        parameters.setRotation(90);
        mCamera.setParameters(parameters);
      end
      曝光补偿.setRotation(角度);
      ISO.setRotation(角度);
      白平衡.setRotation(角度);
      最新照片CardView.setRotation(角度);
      菜单卡片父布局.setRotation(角度);
      菜单卡片.setRotation(角度);
      变焦倍率标题.setRotation(角度);
      设置LinearLayout.setRotation(角度);
      滤镜LinearLayout.setRotation(角度);
      闪光灯LinearLayout.setRotation(角度);
      工具箱LinearLayout.setRotation(角度);
      对焦模式.setRotation(角度);
      拍照ImageView.setRotation(角度);
      录像mageView.setRotation(角度);
      切换摄像头LinearLayout.setRotation(角度);
      加锁ImageView.setRotation(角度);
    end
  end,nil})
传感器.registerListener(sel, 重力传感器, SensorManager.SENSOR_DELAY_UI)
end
function onPause()
  --activity.finish()
  --注销所有传感器的监听
  传感器.unregisterListener(sel);
end
拖动条颜色(变焦seekBar,Color.parseColor(强调色))
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
AutoSetToolTip(加锁LinearLayout,"加锁")
AutoSetToolTip(tv,"拍照")
AutoSetToolTip(最新照片父布局,"最新照片")
--[[xpcall(function()
end,function(e)
  --先导入包
  import "android.content.*"
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(e)
end)]]
切换摄像头LinearLayout.onClick=function()
  --[[CameraInfo.CAMERA_FACING_BACK 后摄像头
        CameraInfo.CAMERA_FACING_FRONT  前摄像头]]
  if (摄像头==CameraInfo.CAMERA_FACING_BACK) then
    activity.newActivity('main',android.R.anim.fade_in,android.R.anim.fade_out,{CameraInfo.CAMERA_FACING_FRONT})
    activity.finish()
   else
    activity.newActivity('main',android.R.anim.fade_in,android.R.anim.fade_out,{CameraInfo.CAMERA_FACING_BACK})
    activity.finish()
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
   else
    --控件不可视
    拍照LinearLayout2.setVisibility(View.INVISIBLE)
    --控件可视
    录像LinearLayout2.setVisibility(View.VISIBLE)
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
   else
    --控件不可视
    录像LinearLayout2.setVisibility(View.INVISIBLE)
    --控件可视
    拍照LinearLayout2.setVisibility(View.VISIBLE)
  end
  当前模式="普通录像"
  --震动()
end
