import "java.io.File"
import "android.graphics.BitmapFactory"
import "android.graphics.Bitmap"
import "android.graphics.Paint"
import "android.graphics.Canvas"
import "android.graphics.ColorMatrix"
import "android.graphics.ColorMatrixColorFilter"
MAX_VALUE = 255;
MID_VALUE = 127;
function 处理图片(路径)
  mBitmap=BitmapFactory.decodeFile(路径)
  bmp = Bitmap.createBitmap(mBitmap.getWidth(), mBitmap.getHeight(), Bitmap.Config.ARGB_8888);
  canvas =Canvas(bmp);
  paint = Paint(Paint.ANTI_ALIAS_FLAG);
  --饱和度
  satMatrix = ColorMatrix();
  mSat = 220 * 1.0/ MID_VALUE;
  satMatrix.setSaturation(mSat);
  imageMatrix =ColorMatrix();
  imageMatrix.postConcat(satMatrix);
  paint.setColorFilter(ColorMatrixColorFilter(imageMatrix));
  canvas.drawBitmap(mBitmap, 0, 0, paint);
  return bmp
end

function SavePicture(name,bm,事件)
  if bm then
    name=tostring(name)
    f = File(name)
    out = FileOutputStream(f)
    if (数据列表0.图像格式=="jpg") then
      编码格式=Bitmap.CompressFormat.JPEG
     elseif (数据列表0.图像格式=="png") then
      编码格式=Bitmap.CompressFormat.PNG
     elseif (数据列表0.图像格式=="webp") then
      编码格式=Bitmap.CompressFormat.WEBP
    end
    bm.compress(编码格式,数据列表0.图像质量, out)
    out.flush()
    out.close()
    通知图库更新图片(name)
    import "java.io.File"
    catalog=File(数据列表0.保存位置)
    name=".jpg"
    find(catalog,name,iD)
    if 事件 then
      事件()
    end
    return true
   else
    return false
  end
end

function 双重曝光处理()
  print("正在处理")
  require "import"
  import "android.app.*"
  import "android.os.*"
  import "android.widget.*"
  import "android.view.*"
  import "android.graphics.*"
  import "android.renderscript.*"
  import "android.graphics.drawable.*"
  import "com.nirenr.Color"
  import "android.graphics.Color"
  import "android.app.AlertDialog"
  import "android.app.AlertDialog$Builder"
  --像素列表3={}
  图像列表=luajava.astable(File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/").listFiles() or File{})
  --print(伪长曝光图像列表[1])
  --伪长曝光图像列表=luajava.astable(伪长曝光图像列表)
  被处理图片=BitmapFactory.decodeFile(tostring(图像列表[1]))
  被处理图片2=BitmapFactory.decodeFile(tostring(图像列表[2]))
  MAX_VALUE = 255;
  MID_VALUE = 127;
  bmp = Bitmap.createBitmap(被处理图片.getWidth(), 被处理图片.getHeight(), Bitmap.Config.ARGB_8888);
  canvas =Canvas(bmp);
  paint = Paint(Paint.ANTI_ALIAS_FLAG);
  --饱和度
  satMatrix = ColorMatrix();
  mSat = 127 * 1.0/ MID_VALUE;
  satMatrix.setSaturation(mSat);
  imageMatrix =ColorMatrix();
  imageMatrix.postConcat(satMatrix);
  paint.setColor(0xffffffff/2)
  paint.setColorFilter(ColorMatrixColorFilter(imageMatrix));
  canvas.drawBitmap(被处理图片, 0, 0, paint);
  canvas.drawBitmap(被处理图片2, 0, 0, paint);
  import "android.text.TextPaint"
  mTextPaint=TextPaint(paint)
  mTextPaint.setTextSize(数据列表0.水印大小);
  mTextPaint.setColor(0xffffffff);
  fontMetrics = mTextPaint.getFontMetrics();
  mTextPaint.clearShadowLayer();
  import "java.lang.Math"
  canvas.drawText(os.date("%Y-%m-%d"),Math.abs((被处理图片.getHeight()/18)), Math.abs(被处理图片.getHeight()-(被处理图片.getHeight()/18)), mTextPaint);
  import "java.io.FileOutputStream"
  import "java.io.File"
  import "android.graphics.Bitmap"
  function string2tab(t)
    return load(table.concat({"return ",t},""))()
  end
  数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
  SavePicture((数据列表0.保存位置).."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式,bmp)
  --使用File类
  import "java.io.File"--导入File类
  LuaUtil.rmDir(File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/"))
  File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/")
end
function 伪长曝光处理(SavePicturem)
  print("正在处理")
  require "import"
  import "android.app.*"
  import "android.os.*"
  import "android.widget.*"
  import "android.view.*"
  import "android.graphics.*"
  import "android.renderscript.*"
  import "android.graphics.drawable.*"
  import "com.nirenr.Color"
  import "android.graphics.Color"
  import "android.app.AlertDialog"
  import "android.app.AlertDialog$Builder"
  --像素列表3={}
  图像列表=luajava.astable(File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/").listFiles() or File{})
  --print(伪长曝光图像列表[1])
  --伪长曝光图像列表=luajava.astable(伪长曝光图像列表)
  被处理图片1=BitmapFactory.decodeFile(tostring(图像列表[1]))

  MAX_VALUE = 255;
  MID_VALUE = 127;
  bmp = Bitmap.createBitmap(被处理图片1.getWidth(), 被处理图片1.getHeight(), Bitmap.Config.ARGB_8888);
  canvas =Canvas(bmp);
  paint = Paint(Paint.ANTI_ALIAS_FLAG);
  --饱和度
  satMatrix = ColorMatrix();
  mSat = 127 * 1.0/ MID_VALUE;
  satMatrix.setSaturation(mSat);
  imageMatrix =ColorMatrix();
  imageMatrix.postConcat(satMatrix);
  paint.setColor(0xffffffff/#图像列表)
  --paint.setColorFilter(ColorMatrixColorFilter(imageMatrix));
canvas.drawBitmap(BitmapFactory.decodeFile(tostring(图像列表[1])), 0, 0, paint);
canvas.drawBitmap(BitmapFactory.decodeFile(tostring(图像列表[3])), 0, 0, paint);
canvas.drawBitmap(BitmapFactory.decodeFile(tostring(图像列表[2])), 0, 0, paint);
 --[[ for d,内容 in pairs(图像列表) do
       canvas.drawBitmap(BitmapFactory.decodeFile(tostring(内容)), 0, 0, paint);
  end]]
  import "java.io.FileOutputStream"
  import "java.io.File"
  import "android.graphics.Bitmap"
  function string2tab(t)
    return load(table.concat({"return ",t},""))()
  end
  数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
  SavePicturem((数据列表0.保存位置).."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式,bmp)
end

function 水印处理()
  print("正在处理")
  require "import"
  import "android.app.*"
  import "android.os.*"
  import "android.widget.*"
  import "android.view.*"
  import "android.graphics.*"
  import "android.renderscript.*"
  import "android.graphics.drawable.*"
  import "com.nirenr.Color"
  import "android.graphics.Color"
  import "android.app.AlertDialog"
  import "android.app.AlertDialog$Builder"
  --像素列表3={}
  图像列表=luajava.astable(File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/").listFiles() or File{})
  --print(伪长曝光图像列表[1])
  --伪长曝光图像列表=luajava.astable(伪长曝光图像列表)
  被处理图片=BitmapFactory.decodeFile(tostring(图像列表[1]))
  MAX_VALUE = 255;
  MID_VALUE = 127;
  bmp = Bitmap.createBitmap(被处理图片.getWidth(), 被处理图片.getHeight(), Bitmap.Config.ARGB_8888);
  canvas =Canvas(bmp);
  paint = Paint(Paint.ANTI_ALIAS_FLAG);
  --饱和度
  satMatrix = ColorMatrix();
  mSat = 127 * 1.0/ MID_VALUE;
  satMatrix.setSaturation(mSat);
  imageMatrix =ColorMatrix();
  imageMatrix.postConcat(satMatrix);
  --paint.setColor(0xffffffff)
  paint.setColorFilter(ColorMatrixColorFilter(imageMatrix));
  canvas.drawBitmap(被处理图片, 0, 0, paint);
  --canvas.rotate(180*Math.PI/180)
  import "android.text.TextPaint"
  mTextPaint=TextPaint(paint)
  mTextPaint.setTextSize(数据列表0.水印大小);
  mTextPaint.setColor(0xffffffff);
  fontMetrics = mTextPaint.getFontMetrics();
  mTextPaint.clearShadowLayer();
  import "java.lang.Math"
  canvas.drawText(os.date("%Y-%m-%d"),Math.abs((被处理图片.getHeight()/18)), Math.abs(被处理图片.getHeight()-(被处理图片.getHeight()/18)), mTextPaint);
  import "java.io.FileOutputStream"
  import "java.io.File"
  import "android.graphics.Bitmap"

  function string2tab(t)
    return load(table.concat({"return ",t},""))()
  end
  数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
  SavePicture((数据列表0.保存位置).."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式,bmp)
  --使用File类
  import "java.io.File"--导入File类
  LuaUtil.rmDir(File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/"))
  File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/")
end
function HDR处理()
  print("正在处理")
  require "import"
  import "android.app.*"
  import "android.os.*"
  import "android.widget.*"
  import "android.view.*"
  import "android.graphics.*"
  import "android.renderscript.*"
  import "android.graphics.drawable.*"
  import "com.nirenr.Color"
  import "android.graphics.Color"
  import "android.app.AlertDialog"
  import "android.app.AlertDialog$Builder"
  --像素列表3={}
  图像列表=luajava.astable(File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/").listFiles() or File{})
  --print(伪长曝光图像列表[1])
  --伪长曝光图像列表=luajava.astable(伪长曝光图像列表)
  被处理图片=BitmapFactory.decodeFile(tostring(图像列表[1]))
  被处理图片2=BitmapFactory.decodeFile(tostring(图像列表[2]))
  被处理图片3=BitmapFactory.decodeFile(tostring(图像列表[3]))
  print(被处理图片.height)
  for mheight=1,被处理图片.height do
    mPixels={}
    --被处理图片.getPixels(mPixels,0,1,1,0,1,5)
    被处理图片亮度=utf8.sub(tostring(被处理图片.getPixel(mwidth,mheight)),1,2)
    被处理图片2亮度=utf8.sub(tostring(被处理图片2.getPixel(mwidth,mheight)),1,2)
    被处理图片3亮度=utf8.sub(tostring(被处理图片3.getPixel(mwidth,mheight)),1,2)
    被处理图片亮度=被处理图片亮度-(0xff/2)
    被处理图片2亮度=被处理图片2亮度-(0xff/2)
    被处理图片3亮度=被处理图片3亮度-(0xff/2)
    if 被处理图片亮度<0 then
      被处理图片亮度=utf8.sub(tostring(被处理图片亮度),2,#(tostring(被处理图片亮度)))
    end
    if 被处理图片2亮度<0 then
      被处理图片2亮度=utf8.sub(tostring(被处理图片2亮度),2,#(tostring(被处理图片2亮度)))
    end
    if 被处理图片3亮度<0 then
      被处理图片3亮度=utf8.sub(tostring(被处理图片3亮度),2,#(tostring(被处理图片3亮度)))
    end
    亮度表={{被处理图片亮度,被处理图片.getPixel(mwidth,mheight)},{被处理图片2亮度,被处理图片2.getPixel(mwidth,mheight)},{被处理图片3亮度,被处理图片3.getPixel(mwidth,mheight)}}
    table.sort(亮度表,function(a,b)
      return ((a[1])>(b[1]))
    end)
    被处理图片.setPixel(亮度表[3][2],mwidth,mheight)
  end
  import "java.io.FileOutputStream"
  import "java.io.File"
  import "android.graphics.Bitmap"
  function string2tab(t)
    return load(table.concat({"return ",t},""))()
  end
  数据列表0=string2tab(io.open("/sdcard/Android/data/"..activity.getPackageName().."/data.aly"):read("*a"))
  SavePicture((数据列表0.保存位置).."IMG_" .. DateFormat().format("yyyyMMdd_hhmmss", Calendar.getInstance(Locale.CHINA)) .. "."..数据列表0.图像格式,被处理图片)
  --使用File类
  import "java.io.File"--导入File类
  LuaUtil.rmDir(File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/"))
  File("/sdcard/Android/data/"..activity.getPackageName().."/ImageList/")
end