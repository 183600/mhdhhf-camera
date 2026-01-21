import "sts"
import "com.michael.NoScrollListView"--导入可以嵌套在Scrollview里的列表
import "tupianchuli"
import "android.graphics.drawable.BitmapDrawable"
import "android.graphics.Color"
import "android.content.res.ColorStateList"
import "android.graphics.PorterDuff"
import "android.graphics.ColorFilter"
import "android.graphics.PorterDuffColorFilter"
function 拖动条颜色(id,颜色)
  id.ProgressDrawable.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
  --修改SeekBar滑块颜色
  id.Thumb.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
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
function string2tab(t)
  return load(table.concat({"return ",t},""))()
end
function DialogButtonFilter(dialog,button--[[,WidgetColor]])
  if Build.VERSION.SDK_INT >= 21 then
    WidgetColor=强调色2
    import "android.graphics.PorterDuffColorFilter"
    import "android.graphics.PorterDuff"
    dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(WidgetColor)
    dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(WidgetColor)
    dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(WidgetColor)

  end
end
--第一个参数为对话框的变量
--第二个参数为1时，则修改POSITIVE按钮颜色,为二则修改NEGATIVE按钮颜色,为三则修改NEUTRAL按钮颜色
--第三个参数为要修改成的颜色
import "android.view.animation.AlphaAnimation"
背景=0xff2b2b2b
背景2="#ff2b2b2b"
卡片="#FF212121"
网页覆盖色="#66191919"
文字=0xFFffffff
文字123=0x8bffffff
底栏="#FF191919"
强调色="#ffffe846"
强调色2=0xffffe846
activity.setTheme(android.R.style.Theme_Material)
activity.ActionBar.hide()
activity.getWindow().setNavigationBarColor(0xff2b2b2b)
function 加载(url)
  import "android.content.Intent"
  import "android.net.Uri"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
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
import "android.content.res.ColorStateList"
function 波纹(id,lx,color)
  xpcall(function()
    ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    for index,content in ipairs(id) do
      if lx=="圆" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      if lx=="方" then
        -- content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))
        content.setBackgroundDrawable(波纹2(color))
      end
    end
  end,function(e)
  end)
end
function 控件边框(id,r,t,y,宽度)
  import "android.graphics.Color"
  InsideColor = Color.parseColor(t)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  --设置填充色
  drawable.setColor(InsideColor)
  --设置圆角 : 左上 右上 右下 左下
  drawable.setCornerRadii({r, r, r, r, r, r, r, r});
  --设置边框 : 宽度 颜色
  drawable.setStroke(宽度, Color.parseColor(y))
  id.setBackgroundDrawable(drawable)
end
function dp2px(dpValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return dpValue * scale + 0.5
end
function AutoSetToolTip(view,text)
  if tonumber(Build.VERSION.SDK) >= 26 then
    view.setTooltipText(text)
  end
end

require "import"

function find(catalog,name,iD)
  local n=0
  local t=os.clock()
  local ret={}
  require "import"
  import "java.io.File"
  import "java.lang.String"
  function FindFile(catalog,name)
    local name=tostring(name)
    local ls=catalog.listFiles() or File{}
    for 次数=0,#ls-1 do
      --local 目录=tostring(ls[次数])
      local f=ls[次数]
      if f.isDirectory() then--如果是文件夹则继续匹配
       else--如果是文件则
        n=n+1
        if n%1000==0 then
          --print(n,os.clock()-t)
        end
        local nm=f.Name
        if string.find(nm,name) then
          --thread(insert,目录)
          table.insert(ret,tostring(f))
          --print(nm)
        end
      end
      luajava.clear(f)
    end

  end
  FindFile(catalog,name)
  function GetFilelastTime(path)
    f = File(path);
    cal = Calendar.getInstance();
    time = f.lastModified()
    cal.setTimeInMillis(time);
    return cal.getTime().toLocaleString()
  end
  function OpenFile(path)
    import "android.webkit.MimeTypeMap"
    import "android.content.Intent"
    import "android.net.Uri"
    import "java.io.File"
    FileName=tostring(File(path).Name)
    ExtensionName=FileName:match("%.(.+)")
    Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
    if Mime then
      intent = Intent();
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      intent.setAction(Intent.ACTION_VIEW);
      intent.setDataAndType(Uri.fromFile(File(path)), Mime);
      activity.startActivity(intent);
     else
      print("找不到可以用来打开此文件的程序")
    end
  end
  table.sort(ret,function(a,b)
    return (GetFilelastTime(a)<GetFilelastTime(b))
  end)
  --设置的图片也可以输入路径
  最新照片.setImageBitmap(loadbitmap([[/]]..ret[#ret]))

  最新照片父布局.onClick=function()
    OpenFile([[/]]..ret[#ret])
  end

  import "android.content.res.ColorStateList"
  function 波纹(id,lx,color)
    -- xpcall(function()
    ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    for index,content in ipairs(id) do
      if lx=="圆" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      if lx=="方" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      content.onTouchListener=点击监听--动画效果
    end
    --  end,function(e)end)
  end
  波纹({最新照片父布局},"方",文字)
end
function 初始化(最高分辨率表,视频分辨率表m)
  import "android.hardware.camera2.*"
  local 数据列表={
    图像分辨率height=最高分辨率表[1].height,
    图像分辨率width=最高分辨率表[1].width,
    参考线=false,--true
    保存位置="/sdcard/DCIM/Camera/",
    图像格式="jpg",
    图像质量=95,
    防牛顿环配置="auto",
    零延时拍照=true,
    C2降噪模式=CaptureRequest.NOISE_REDUCTION_MODE_OFF,
    C2是否RAW="RAW",
    是否启用C2=false,
    是否软件内处理图像=false,
    是否启用水印=false,
    水印大小=125,
  }
  if 视频分辨率表m then
    数据列表.视频分辨率height=视频分辨率表m[1].height
    数据列表.视频分辨率width=视频分辨率表m[1].width
    视频分辨率表={}
    for d,内容 in pairs(视频分辨率表m) do
      视频分辨率表[d]=({内容.height,内容.width})
    end
    table.sort(视频分辨率表,function(a,b)
      return ((a[2]*a[1])>(b[2]*b[1]))
    end)
    写入文件("/sdcard/Android/data/"..activity.getPackageName().."/视频分辨率表.aly",dump(视频分辨率表))
  end
  视频分辨率表=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/视频分辨率表.aly"):read("*a"))
  --数据列表=数据列表0
  --写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
  if 文件是否存在("/sdcard/Android/data/"..activity.getPackageName().."/data.aly")==false then
    写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表))
    数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
   else
    数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
    for d,内容 in pairs(数据列表) do
      是否包含="否"
      for d2,内容2 in pairs(数据列表0) do
        if (d2==d) then
          是否包含="是"
        end
      end
      if (是否包含=="是") then
       else
        --  loadstring("数据列表0."..d.."="..内容)()
        数据列表0[d]=内容
      end
    end
    写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
  end
  File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/").mkdir()
  if 数据列表0.参考线 then
   else
    --控件不可视
    参考线.setVisibility(View.INVISIBLE)
  end
end
隐私政策=[[隐私政策
qwe12345678(本软件作者)开发了该开源的应用程序Mhdhhf相机。该服务由qwe12345678提供，旨在安装并使用。

我对您使用Mhdhhf相机的隐私政策做出规定，并解释了我如何收集，保护和披露您因使用我的服务而产生的信息。

如果您选择使用我提供的服务，则表示您同意收集和使用与此政策相关的信息。我收集的个人信息用于提供和改进服务。除非本隐私政策中另有说明，否则我不会与任何人一起使用或分享您的信息。

除非本隐私政策另有规定，否则本隐私政策中使用的术语与我们的条款和条件具有相同的含义，可在Mhdhhf相机中访问。

信息收集与使用

为了获得更好的体验，在使用我们的服务时，我可能会要求您向我们提供某些个人身份信息，包括但不限于不收集. 我请求的信息将保留在您的设备上，不会被我以任何方式收集。

记录数据

当您使用我的服务时，如果应用程序出现错误，我会通过第三方数据统计在您的手机上收集数据和信息。该日志数据可能包含以下信息，例如：您的设备Internet协议（ IP）地址，设备名称，操作系统版本，使用我的服务时应用的配置，您使用该服务的时间和日期以及其他统计信息。

Cookies

Cookies是具有少量数据的文件，通常用作匿名唯一标识符。 这些信息将从您访问的网站发送到浏览器，并存储在设备的内存中。

本应用未明确使用这些Cookies。但是，该应用程序可能使用第三方代码和使用带有Cookies的库来收集信息并改善其服务。 您可以选择接受还是拒绝这些Cookies，并知道何时将Cookies发送到您的设备。 如果您选择拒绝我们的Cookies，则可能无法使用本服务的部分功能。

服务供应商

我可能由于以下原因雇用第三方公司和个人：

促进我们的服务质量；
代表我们提供服务；
提供与服务相关的服务；
帮助我们分析如何使用我们的服务。
我想通知此服务的用户，这些第三方有权访问您的个人信息。原因是代表我们执行分配给他们的任务。但是，他们有义务不出于任何其他目的披露或使用该信息。

安全

我很重视您对我们提供您的个人信息的信任，因此我们正在努力使用商业上可接受的方法来保护它。但是请记住，没有一种通过互联网传输的方法，或者说电子存储的方法是100%安全可靠的，我不能保证它的绝对安全性。

到其他网站的链接

此服务可能包含指向其他网站的链接。如果你点击第三方链接，你将被引导到该网站。注意，这些外部站点不是由我操作的。因此，我强烈建议您查看这些网站的隐私策略。我对任何第三方网站或服务的内容、隐私政策或做法没有控制权，也不承担任何责任。

儿童隐私

这些服务不面向13岁以下的青少年。我不会有意收集13岁以下儿童的个人身份信息。如果我发现13岁以下的儿童向我提供了个人信息，我会立即从我们的服务器中删除这些信息。 如果您是父母或监护人，并且知道您的孩子向我提供了个人信息，请与我联系，以便我能够采取必要的措施。

本隐私政策的变更

我可能会不时更新我们的隐私政策。因此，建议您定期查看此页以了解更改。如有任何更改，我会在本页公布新的隐私政策。

该政策自2020-05-17起生效。

联系我们

如果您对我的隐私政策有任何疑问或建议，请随时通过zhongwenjia2009@163.com与我联系。


此隐私政策页面是在 privacypolicytemplate.net 创建的，并由 应用隐私政策生成器 生成。]]
用户协议=[[条款和条件
下载或使用该应用程序，此条款将自动适用于您——因此，请确保在使用该应用程序之前仔细阅读这些条款。.

qwe12345678(本软件作者)致力于确保该应用程序尽可能有用和高效。因此，我保留随时对应用程序进行更改或对其服务收费的权利。如果没有向您明确说明您支付的费用，我永远不会向您收取应用程序或其服务费用。

您应该意识到，qwe12345678在某些情况下不承担任何责任。应用程序的某些功能要求应用程序具有活动的internet连接。连接可以是Wi-Fi，也可以由您的移动网络提供商提供，但如果您无法访问Wi-Fi，并且您没有任何剩余的数据空间，则qwe12345678无法对应用程序无法完全正常工作承担责任。

同样，qwe12345678也不能总是对你使用应用程序的方式负责，也就是说，你需要确保你的设备保持充电状态——如果电池用完了，你不能打开它来使用服务，qwe12345678不能承担责任。

关于qwe12345678对您使用该应用程序的责任，当您使用该应用程序时，请务必记住，尽管我努力确保它在任何时候都是更新和正确运行的，但我依赖第三方向我提供信息，以便我可以向您提供信息。qwe12345678对于您因完全依赖应用程序的此功能而遭受的任何直接或间接损失，概不负责。

在某个时候，我可能希望更新应用程序。应用程序的需求可能会发生变化，qwe12345678不保证应用程序将始终更新，使其与您相关和或与您设备上安装的版本可以使用。但是，您保证在提供给您时始终接受该应用程序的更新。我也可能停止提供该应用程序，并且可以在不通知您终止的情况下随时终止其使用。除非我另行告知，否则在任何终止后，（a）这些条款授予您的权利和许可将终止；（b）您必须停止使用该应用程序，并且（如果需要）将其从设备中删除。

本条款和条件的变更

我可能会不时更新我的条款和条件。因此，建议您定期查看此页以了解更改。如有任何更改，我会在本页公布新的条款和条件。

这些条款和条件自2020-05-17起生效。

联系我们

如果您对我的隐私政策有任何疑问或建议，请随时通过zhongwenjia2009@163.com 与我联系。


此条款和条件页面是由 应用隐私政策生成器 生成的。]]
qweasd用户协议=AlertDialog.Builder(this)
.setTitle("用户协议")
.setMessage(tostring(用户协议))
.setCancelable(false)
.setPositiveButton("同意",{onClick=function()
    if 隐私政策2=="1"
      写入文件("/data/data/"..activity.getPackageName().."/用户协议和隐私政策.xml","关闭")--#c7ffffff
     else
      qweasd隐私政策.show()
    end
    用户协议2="1"
  end})--设置积极按钮
.setNeutralButton("隐私政策",{onClick=function()
    qweasd隐私政策.show()
  end})--设置中立按钮
.setNegativeButton("不同意",{onClick=function()activity.finish() end})--设置否认按钮
--普通对话框
qweasd隐私政策=AlertDialog.Builder(this)
.setTitle("隐私政策")
.setMessage(tostring(隐私政策))
.setNeutralButton("用户协议",{onClick=function()qweasd用户协议.show() end})
.setPositiveButton("同意",{onClick=function()
    if 用户协议2=="1"
      写入文件("/data/data/"..activity.getPackageName().."/用户协议和隐私政策.xml","关闭")--#c7ffffff
     else
      qweasd用户协议.show()
    end
    隐私政策2="1"
  end})--设置积极按钮
.setNegativeButton("不同意",{onClick=function()activity.finish() end})--设置否认按钮
--[[列表对话框
items={"用户协议","隐私政策"}
AlertDialog.Builder(this)
.setTitle("列表对话框")
.setCancelable(false)
.setItems(items,{onClick=function(l,v)
    if items[v+1]=="用户协议"
      -- 提示(用户协议)
      qweasd用户协议.show()
    end
    if items[v+1]=="隐私政策"
      -- 提示(隐私政策)
      qweasd隐私政策.show()
    end
  end})
.show()
]]
if 文件是否存在("/data/data/"..activity.getPackageName().."/用户协议和隐私政策.xml")==false then
  qweasd用户协议.show()
 else
end
function 保留小数位(原数,位数)
  return string.format("%."..到文本(位数).."f",到文本(原数))
end
function 四舍五入(原数,精度)
  local 保留精度 = 10^(精度 or 0)
  local 精度保留 = 保留精度 * 10
  return math.floor((原数*精度保留+5)/10)/保留精度
end
function 震动(震动时间)
  import "android.content.Context"
  --导入包
  vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
  vibrator.vibrate( long{0,震动时间 or 20} ,-1)
  --{等待时间,振动时间,等待时间,振动时间,…}
  --{0,1000,500,1000,500,1000}
  --别忘了申明权限
end
--获取状态栏和高度

function getStatusBarHeight()--函数
  return activity.getResources().getDimensionPixelSize( luajava.bindClass("com.android.internal.R$dimen")().status_bar_height);
end
function 通知图库更新图片(图片路径)
  import "android.media.MediaScannerConnection"
  MediaScannerConnection.scanFile(activity, {File(图片路径).getAbsolutePath()}, nil, nil)
end
function save(data,数据列表0,路径,质量)
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
  mBitmap.compress(编码格式,质量 or 数据列表0.图像质量, os);
  os.flush();
  os.close();
  function 通知图库更新图片(图片路径)
    import "android.media.MediaScannerConnection"
    MediaScannerConnection.scanFile(activity, {File(图片路径).getAbsolutePath()}, nil, nil)
  end
  通知图库更新图片(tostring(file))
  --import("android.media.ExifInterface")
  return tostring(file)
end
function 获取工具菜单布局()
  return{
    LinearLayout;
    layout_width="fill";
    orientation="horizontal";
    {
      FrameLayout;
      layout_width="fill";
      layout_weight="1";
      {
        FrameLayout;
        layout_width="fill";
        id="项目一背景";
      };
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
      FrameLayout;
      layout_width="fill";
      layout_weight="1";
      {
        FrameLayout;
        layout_width="fill";
        id="项目二背景";
      };
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
      FrameLayout;
      layout_width="fill";
      layout_weight="1";
      {
        FrameLayout;
        layout_width="fill";
        id="项目三背景";
      };
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
end
lasttime=0
function onKeyDown(code,event)
  if (设置页面状态=="主页") then
    关闭对话框()
    设置页面状态="无"
    return true
   elseif (设置页面状态=="关于") then
    --控件不可视
    关于scrollView.setVisibility(View.INVISIBLE)
    --控件不可视
    开源许可背景.setVisibility(View.INVISIBLE)
    --控件可视
    yuxuanpop.setVisibility(View.VISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    yuxuanpop父布局.startAnimation(透明动画)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    关于父布局.startAnimation(透明动画)
    设置页面状态="主页"
    return true
   elseif (设置页面状态=="开源许可") then
    --控件不可视
    yuxuanpop.setVisibility(View.INVISIBLE)
    --控件不可视
    开源许可背景.setVisibility(View.INVISIBLE)
    --控件可视
    关于scrollView.setVisibility(View.VISIBLE)
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    关于父布局.startAnimation(透明动画)
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    yuxuanpop父布局.startAnimation(透明动画)
    设置页面状态="关于"
    return true
   elseif (seekBar背景.Visibility==View.VISIBLE) and 是否c2=="否" then
    判断是否隐藏滑动条()
    return true
   elseif (seekBar背景父布局.Visibility==View.VISIBLE) and 是否c2=="是" then
    判断是否隐藏滑动条()
    return true
   else
    local now=os.time()
    if (code== KeyEvent.KEYCODE_BACK)then
      if now-lasttime>1 then
        Toast.makeText(activity,"再按一次退出",1000).show()
        lasttime=now
        return true
       else
        --os.exit()
        return false
      end
    end
  end
end
activity.setRequestedOrientation(1)