function 打开页面(信息列表)
  import "android.graphics.drawable.ColorDrawable"
  import "android.net.Uri"
  包名=this.getPackageManager().getPackageInfo(this.getPackageName(),((32552732/2/2-8183)/10000-6-231)/9)
  版本=tostring(包名.versionName)
  版本号=tonumber(包名.versionCode)
  cg=
  {
    FrameLayout;
    layout_height="fill";
    layout_width="fill";
    id="yuxuanpop0",
    background="#EF0D0D0D",
    {
      LinearLayout;--线性布局
      Orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      id="开源许可背景父布局",
      {
        LinearLayout;--线性布局
        Orientation='vertical';--布局方向
        layout_width='fill';--布局宽度
        layout_height='fill';--布局高度
        id="开源许可背景",
        {
          LinearLayout;
          layout_width="fill";
          orientation="horizontal";
          layout_height="56dp";
          -- elevation="3dp";
          {
            LinearLayout;
            gravity="center";
            layout_width="56dp";
            layout_height="56dp";
            id="开源许可Sideslipp";
            {
              ImageView;
              layout_height="28dp";
              src="png/__ic_fltbtn.png";
              --  id="Sideslip1";
              colorFilter=0xffffffff;
              -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
              layout_width="25dp";
            };
          };
          {
            LinearLayout;
            layout_height="fill";
            layout_weight="1";
            orientation="horizontal";
            {
              TextView;
              text="开源许可";
              textColor=0xffffffff;
              layout_gravity="center";
              textSize="18sp";
              -- id="标题";
            };
          };
        };
        {--滚动布局下必须有线性竖直布局
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          {--添加一个list布局，这个时候list是空的，还没有匹配数据
            --仅仅是在屏幕布局内开辟一块大空间作为list布局
            ListView;
            fastScrollEnabled=true;
            layout_width="fill";
            layout_height="fill";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
            --这里是分割线的意思
            dividerHeight="0";
            --background=背景2;
            id="list";
          };
        };
      };
    };
    {
      LinearLayout;--线性布局
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      id='关于父布局';--布局高度
      {
        ScrollView;--线性布局
        layout_width='fill';--布局宽度
        layout_height='fill';--布局高度
        id='关于scrollView';--布局高度
        {--滚动布局下必须有线性竖直布局
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          --BackgroundColor=背景2,
          {
            LinearLayout;
            layout_width="fill";
            orientation="horizontal";
            layout_height="56dp";
            -- elevation="3dp";
            {
              LinearLayout;
              gravity="center";
              layout_width="56dp";
              layout_height="56dp";
              id="关于Sideslipp";
              {
                ImageView;
                layout_height="28dp";
                src="png/__ic_fltbtn.png";
                --  id="Sideslip1";
                colorFilter=0xffffffff;
                -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
                layout_width="25dp";
              };
            };
            {
              LinearLayout;
              layout_height="fill";
              layout_weight="1";
              orientation="horizontal";
              {
                TextView;
                text='关于';
                textColor=0xffffffff;
                layout_gravity="center";
                textSize="18sp";
                -- id="标题";
              };
            };
          };
          --[[{
        LinearLayout;
        Orientation='vertical';
        layout_width='fill';
        layout_height='170dp';
        BackgroundColor=装饰色;
        id='装饰背景';
      };]]
          {
            LinearLayout;
            Orientation='vertical';
            layout_width='fill';
            layout_height='fill';
            {
              LinearLayout;
              background='icon.png';
              layout_gravity='center';
              layout_width='80dp';
              layout_height='80dp';
              layout_marginTop='56dp';
              layout_margin='16dp';
            };
            {
              TextView;
              layout_width='wrap';
              layout_height='wrap';
              --Gravity='center|left';
              layout_gravity='center';
              gravity='center';
              layout_margin='13dp';
              layout_marginTop='0';
              textColor='#FF000000';
              text="版本："..版本;
              textSize='15sp';
              id="版本";
              textColor=文字;
            };

          };
          {
            TextView,
            id="qwe",
            --textColor="#ff000000";
            textSize="0sp",
            --layout_margin="0dp",
            --layout_width="fill",
            layout_width="0dp",
            layout_marginLeft="0dp";
            layout_gravity="top",
          },
          {--添加一个list布局，这个时候list是空的，还没有匹配数据
            --仅仅是在屏幕布局内开辟一块大空间作为list布局
            NoScrollListView;
            fastScrollEnabled=true;
            layout_width="fill";
            -- layout_height="fill";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
            --这里是分割线的意思
            dividerHeight="0";
            id="list3";
            layout_marginLeft='10dp';
            --background="#ff4285f4",
          };
        };
      };
    };
    {
      LinearLayout;
      layout_height="fill";
      orientation="vertical";
      layout_width="fill";
      id="yuxuanpop父布局",
      {
        LinearLayout;
        layout_height="fill";
        orientation="vertical";
        layout_width="fill";
        id="yuxuanpop",
        {
          LinearLayout;
          --  id='mToolbar';
          layout_width='fill';--布局宽度
          layout_height="56dp";
          orientation="vertical";
          --background="#AFffffff",
          id="yuxuanpop2",
          elevation="6dp";
          {
            LinearLayout;
            layout_width="fill";
            orientation="horizontal";
            layout_height="56dp";
            -- elevation="3dp";
            {
              LinearLayout;
              gravity="center";
              layout_width="56dp";
              layout_height="56dp";
              id="Sideslipp";
              {
                ImageView;
                layout_height="28dp";
                src="png/__ic_fltbtn.png";
                --  id="Sideslip1";
                colorFilter=0xffffffff;
                -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
                layout_width="25dp";
              };
            };
            {
              LinearLayout;
              layout_height="fill";
              layout_weight="1";
              orientation="horizontal";
              {
                TextView;
                text=信息列表.页面标题;
                textColor=0xffffffff;
                layout_gravity="center";
                textSize="18sp";
                -- id="标题";
              };
            };
          };
        };
        {
          ScrollView,
          layout_width="fill",
          layout_height="wrap",
          FillViewport=true,
          OverScrollMode=1,
          {
            LinearLayout;
            layout_height="fill";
            orientation="vertical";
            layout_width="fill";
            id="内容填充器",
          };
        };
      };
    };
  }
  --定义一个弹窗为PopupWindow类型的弹窗
  local pop=PopupWindow(activity)
  --给弹窗一个自定义布局
  pop.setContentView(loadlayout(cg))
  --修复bug,千万不能删除
  pop.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
  --设置显示宽度
  pop.setWidth(activity.width)
  --设置显示高度
  pop.setHeight(activity.height)
  --点击PopupWindow外面区域  true为消失
  pop.setOutsideTouchable(true)

  --修复bug,千万不能删
  pop.setBackgroundDrawable(BitmapDrawable(loadbitmap("1.jpg")))
  --设置pop可获得焦点
  pop.setFocusable(false)
  --设置pop可触摸
  pop.setTouchable(true)
  --设置弹窗显示位置
  pop.showAtLocation(view,Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL,0,0)
  --yuxuanpop2.addView(loadlayout(信息列表.页面布局))

  --设置动画的属性
  透明动画=AlphaAnimation(0,1)
  透明动画.setDuration(96)--设置动画时间
  透明动画.setFillAfter(true)--设置动画后停留位置
  透明动画.setRepeatCount(0)--设置无限循环
  --绑定动画
  yuxuanpop0.startAnimation(透明动画)
  function 关闭对话框()
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(96)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    yuxuanpop0.startAnimation(透明动画)
    import "android.view.animation.Animation$AnimationListener"

    透明动画.setAnimationListener(AnimationListener{
      onAnimationEnd=function()
        pop.dismiss()
      end})
  end
  设置页面状态="主页"
  Sideslipp.onClick=function()
    关闭对话框()
    设置页面状态="无"
  end
  --控件不可视
  关于scrollView.setVisibility(View.INVISIBLE)
  --控件不可视
  开源许可背景.setVisibility(View.INVISIBLE)
  --控件可视
  yuxuanpop.setVisibility(View.VISIBLE)
  关于Sideslipp.onClick=function()
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
  end
  开源许可Sideslipp.onClick=function()
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
    开源许可背景父布局.startAnimation(透明动画)
    设置页面状态="关于"
  end
  波纹({Sideslipp,
    关于Sideslipp,
    开源许可Sideslipp,
  },"方",文字)
  itemc={
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    layout_height='52dp';
    --id="fpll",
    {
      ImageView;
      -- src=图标;
      layout_width='14dp';
      layout_height='44dp';
      layout_gravity='left|center';
      layout_margin='0dp';
      layout_marginLeft='0dp';
      id='菜cd单';
      ColorFilter=文字;--设置图片着色
      onClick=function()
      end
    };
    {
      TextView,
      id="srct",
      textColor=文字;
      textSize="15sp",
      layout_margin="10dp",
      --layout_width="fill",
      --  layout_width="304dp",
      --textIsSelectable=true,
      layout_marginLeft="3dp";
      layout_gravity="center",
    },
    {
      TextView,
      id="srcb",
      --textColor="#ff000000";
      textSize="0sp",
      --layout_margin="0dp",
      --layout_width="fill",
      layout_width="304dp",
      --textIsSelectable=true,
      layout_marginLeft="3dp";
      layout_gravity="center",
    },
  }
  --一个小list模板已搭建好了，下面开始匹配数据

  --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
  datas={}

  --创建了三个有数据的列表
  aic={}
  aw3={"联系开发者","官方Q群","开源许可","源码和历史版本","用户协议","隐私政策"}
  mmp={"导出导入 添加 删改","导出为xml","当前为"}
  --"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

  --循环添加匹配有数据的列表到
  --nj只是一个变量，你可以用其他变量代替
  --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
  --就相当于  for  1,3   do
  for nj=1,#aw3 do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=aw3[nj],srcf=aic[nj],srcb=mmp[nj]})
  end
  --
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,itemc)

  --将小项目匹配给大list
  list3.Adapter=yuxuan_adpqy
  list3.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      v=pos+1
      if v==1 then
        pop=PopupMenu(activity,qwe)
        menu=pop.Menu
        menu.add("QQ").onMenuItemClick=function(a)
          if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.mobileqq",0) end) then
            url="mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin=3025385472"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
           else
            print("未安装")
          end
        end
        menu.add("酷安").onMenuItemClick=function(a)
          url="http://www.coolapk.com/u/1910517"
          activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
        end
        pop.show()--显示@音六站长～
      end
      if v==2 then
        --调用
        if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.mobileqq",0) end) then
          QQ群("798400036")
         else
          print("未安装")
        end
      end
      if v==3 then
        --控件不可视
        关于scrollView.setVisibility(View.INVISIBLE)
        --控件不可视
        yuxuanpop.setVisibility(View.INVISIBLE)
        --控件可视
        开源许可背景.setVisibility(View.VISIBLE)
        --设置动画的属性
        透明动画=AlphaAnimation(0,1)
        透明动画.setDuration(96)--设置动画时间
        透明动画.setFillAfter(true)--设置动画后停留位置
        透明动画.setRepeatCount(0)--设置无限循环
        --绑定动画
        开源许可背景父布局.startAnimation(透明动画)
        --设置动画的属性
        透明动画=AlphaAnimation(1,0)
        透明动画.setDuration(96)--设置动画时间
        透明动画.setFillAfter(true)--设置动画后停留位置
        透明动画.setRepeatCount(0)--设置无限循环
        --绑定动画
        关于父布局.startAnimation(透明动画)
        设置页面状态="开源许可"
      end
      if v==4 then
        加载("http://www.iyuji.cn/iyuji/s/RWlIQnNReFJrWmxONjREaWEvR2hBUT09/1580171453352562")
      end
      if v==5 then
        提示(用户协议)
      end
      if v==6 then
        提示(隐私政策)
      end
    end
  })
  --设置标题栏()
  function QQ群(h)
    url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin="..h.."&card_type=group&source=qrcode"
    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
  end
  itemc={
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    {
      LinearLayout;
      layout_width="fill";
      --  layout_height="120dp";
      orientation="vertical";
      layout_margin="14dp";
      gravity='center';
      id="背景LinearLayout";
      {
        TextView;
        id="srct";
        -- layout_height="40dp";
        layout_width="fill";
        -- Typeface=字体("Product2");
        textColor=文字,
        gravity="left|bottom",
        textSize="20sp",
        layout_gravity='center';
      };
      {
        TextView;
        id="srcb";
        -- layout_height="40dp";
        layout_width="fill";
        -- Typeface=字体("Product2");
        textColor=文字123,
        gravity="left",
        layout_marginTop="6dp";
        layout_gravity='center';
        -- textSize="15sp",
      };
    };
  }
  --一个小list模板已搭建好了，下面开始匹配数据

  --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
  datas={}

  --创建了三个有数据的列表
  aic={}
  aw3={"Mhdhhf相机",
    "Material design icons",
    "MichaelCustomGridviewWithMultiSelectMode",
  }
  --Card Broswser是一个浏览器，我用了源码里面的清除缓存，和获取浏览器滑动位置。

  mmp={"本软件",
    "Material design icons is the official icon set from Google. The icons are designed under the material design guidelines.来自谷歌官方的 Material Design系统图标集。\nApache-2.0-Google",
    "NoScrollGridView and NoScrollListView with Multi select mode.可嵌套 ScrollView的 ScrollView与 ListView。\nzhxhcoder",
  }
  --"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

  --循环添加匹配有数据的列表到
  --nj只是一个变量，你可以用其他变量代替
  --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
  --就相当于  for  1,3   do
  for nj=1,#aw3 do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=aw3[nj],
      srcb=mmp[nj],
    })
  end
  --
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,itemc)

  --将小项目匹配给大list
  list.Adapter=yuxuan_adpqy
  list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      文本=v.Tag.srct.Text
      if 文本=="Mhdhhf相机" then
        提示("这个项目的源码不使用任何开源许可证！也没有版权。并且是开源的。")
       elseif 文本=="Material design icons" then
        加载("https://github.com/google/material-design-icons")
       elseif 文本=="MichaelCustomGridviewWithMultiSelectMode" then
        加载("https://github.com/zhxhcoder/MichaelCustomGridviewWithMultiSelectMode/")
      end
    end
  })
end
function 设置()
  打开页面({页面标题="设置";
    页面布局="stlayout/st";
  })
  function 添加布局(内容)
    if 内容=="打开参考线" or 内容=="关闭参考线" then
      TextViewid="参考线标题"
     elseif 内容=="打开零延时拍照(使用Camera2时不起作用)" or 内容=="关闭零延时拍照(使用Camera2时不起作用)" then
      TextViewid="零延时拍照"
     elseif 内容=="打开 Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理" or
      内容=="关闭 Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理" then
      TextViewid="是否软件内处理图像标题"
     else
      TextViewid=内容
    end
    return{
      LinearLayout;
      layout_width='fill';
      --layout_height='52dp';
      -- radius='8dp';
      id=内容.."LinearLayout";
      Background=波纹2(文字);
      onClick=function(v)
        if 内容=="设置图像分辨率" then
          --列表对话框
          items={}

          for d,内容 in pairs(最高分辨率表) do
            table.insert(items,内容.width.."x"..内容.height)
          end
          dialog=AlertDialog.Builder(this)
          .setTitle("设置图像分辨率")
          .setItems(items,{onClick=function(l,v)
              数据列表0.图像分辨率height=最高分辨率表[v+1].height
              数据列表0.图像分辨率width=最高分辨率表[v+1].width
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            end})
          .setNegativeButton("取消",nil)--设置否认按钮
          .show()
          DialogButtonFilter(dialog)
         elseif 内容=="设置视频分辨率" then
          --列表对话框
          items={}

          for d,内容 in pairs(视频分辨率表) do
            table.insert(items,内容[2].."x"..内容[1])
          end
          dialog=AlertDialog.Builder(this)
          .setTitle("设置视频分辨率")
          .setItems(items,{onClick=function(l,v)
              数据列表0.视频分辨率height=视频分辨率表[v+1].height
              数据列表0.视频分辨率width=视频分辨率表[v+1].width
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            end})
          .setNegativeButton("取消",nil)--设置否认按钮
          .show()
          DialogButtonFilter(dialog)
         elseif 内容=="打开参考线" or 内容=="关闭参考线" then
          if 参考线标题.Text=="打开参考线" then
            数据列表0.参考线=true
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            参考线标题.Text="关闭参考线"
            --控件可视
            参考线.setVisibility(View.VISIBLE)
           else
            数据列表0.参考线=false
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            参考线标题.Text="打开参考线"
            --控件不可视
            参考线.setVisibility(View.INVISIBLE)
          end
         elseif 内容=="设置保存位置" then
          --输入对话框
          InputLayout={
            LinearLayout;
            orientation="vertical";
            Focusable=true,
            FocusableInTouchMode=true,
            {
              EditText;
              hint="路径";
              layout_marginTop="22dp";
              layout_marginBottom="22dp";
              layout_margin="10dp";
              layout_width="fill";
              layout_gravity="center",
              id="edit";
              text=数据列表0.保存位置
              --Typeface=字体("Product");
            };
          };
          dialog=AlertDialog.Builder(this)
          .setTitle("设置保存位置")
          .setView(loadlayout(InputLayout))
          .setPositiveButton("确定",{onClick=function(v)
              File(edit.Text).mkdirs()
              数据列表0.保存位置=edit.Text
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            end})
          .setNegativeButton("取消",nil)
          .show()
          DialogButtonFilter(dialog)
         elseif 内容=="图像格式" then
          function 切换图像格式显示文本内容()
            if 是否c2=="是" then
              if 格式.Text=="RAW+"..string.upper(前图像格式) then
                格式.Text="RAW+"..string.upper(数据列表0.图像格式)
               elseif 格式.Text==string.upper(前图像格式) then
                格式.Text=string.upper(数据列表0.图像格式)
               else
                格式.Text=string.upper(数据列表0.图像格式)
              end
              数据列表0.C2是否RAW=格式.Text
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            end
          end
          pop=PopupMenu(activity,图像格式)
          menu=pop.Menu
          menu.add("JPG").onMenuItemClick=function(a)
            前图像格式=数据列表0.图像格式
            数据列表0.图像格式="jpg"
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            切换图像格式显示文本内容()
          end
          menu.add("PNG").onMenuItemClick=function(a)
            前图像格式=数据列表0.图像格式
            数据列表0.图像格式="png"
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            切换图像格式显示文本内容()
          end
          menu.add("WEBP").onMenuItemClick=function(a)
            前图像格式=数据列表0.图像格式
            数据列表0.图像格式="webp"
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            切换图像格式显示文本内容()
          end
          pop.show()--显示@音六站长～
         elseif 内容=="图像质量" then
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
              id="图像质量seekBar";
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
          .setTitle("图像质量")
          .setView(loadlayout(InputLayout))
          .setPositiveButton("确定",{onClick=function(v)
              数据列表0.图像质量=图像质量seekBar.getProgress()
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            end})
          --   print(数据列表0.图像质量)
          .setNegativeButton("取消",nil)
          .show()
          DialogButtonFilter(dialog)
          图像质量seekBar.setMax(99)
          图像质量seekBar.setProgress(数据列表0.图像质量)
          --绑定监听
          图像质量seekBar.setOnSeekBarChangeListener{
            onStartTrackingTouch=function()
              --开始拖动
            end,
            onStopTrackingTouch=function()
              --停止拖动
            end,
            onProgressChanged=function()
              --状态改变
              textView.text=tostring(图像质量seekBar.getProgress()+1)
            end}
          textView.text=tostring(图像质量seekBar.getProgress())
          拖动条颜色(图像质量seekBar,Color.parseColor(强调色))
         elseif 内容=="防牛顿环配置" then
          --列表对话框
          items={}
          if 是否c2=="是" then
            当前支持的防牛顿环配置={"auto","50hz","60hz","off"}
          end
          for d,内容 in pairs(当前支持的防牛顿环配置) do
            table.insert(items,内容)
          end
          dialog=AlertDialog.Builder(this)
          .setTitle("防牛顿环配置(Antibanding)")
          .setItems(items,{onClick=function(l,v)
              数据列表0.防牛顿环配置=当前支持的防牛顿环配置[v+1]
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            end})
          .setNegativeButton("取消",nil)--设置否认按钮
          .show()
          DialogButtonFilter(dialog)
         elseif 内容=="打开零延时拍照(使用Camera2时不起作用)" or 内容=="关闭零延时拍照(使用Camera2时不起作用)" then
          if 零延时拍照.Text=="打开零延时拍照(使用Camera2时不起作用)" then
            数据列表0.零延时拍照=true
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            零延时拍照.Text="关闭零延时拍照(使用Camera2时不起作用)"
            parameters.setZSLMode("on")
           else
            数据列表0.零延时拍照=false
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            零延时拍照.Text="打开零延时拍照(使用Camera2时不起作用)"
            parameters.setZSLMode("off")
          end
         elseif 内容=="设置水印" then
          InputLayout={
            LinearLayout;
            orientation="vertical";
            id="背景LinearLayout",
            {
              LinearLayout;
              layout_width='fill';
              BackgroundColor="#20FFFFFF";
              --layout_marginTop="-38.5";
              {
                LinearLayout;
                layout_width='fill';
                id="是否启用水印LinearLayout";
                Background=波纹2(文字);
                onClick=function(v)
                  if 是否启用水印TextView.Text=="打开水印" then
                    数据列表0.是否启用水印=true
                    写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
                    是否启用水印TextView.Text="关闭水印"
                   else
                    数据列表0.是否启用水印=false
                    写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
                    是否启用水印TextView.Text="打开水印"
                  end
                end,
                {
                  TextView;
                  -- layout_width='wrap';
                  layout_height='fill';
                  layout_marginLeft='22dp';
                  layout_margin='16dp';
                  Gravity='left|center';
                  textColor=0xffffffff;
                  text="是否启用水印";
                  id="是否启用水印TextView",
                  textSize='16sp';
                };
              };
            };
            {
              TextView;
              layout_margin="25dp";
              layout_marginBottom="0";
              layout_marginTop="10dp";
              id="水印大小textView";
            };
            {
              SeekBar;
              layout_margin="10dp";
              layout_width="fill";
              id="水印大小seekBar";
              layout_gravity="center";
            };
          };
          dialog=AlertDialog.Builder(this)
          .setTitle("设置水印")
          .setView(loadlayout(InputLayout))
          .setPositiveButton("确定",{onClick=function(v)
              数据列表0.水印大小=水印大小seekBar.Progress
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            end})
          --   print(数据列表0.图像质量)
          .setNegativeButton("取消",nil)
          .show()
          --print(图片外FrameLayout.getLayoutParams().width)
          if 数据列表0.是否启用水印 then
            是否启用水印TextView.Text="关闭水印"
           else
            是否启用水印TextView.Text="打开水印"
          end
          DialogButtonFilter(dialog)
          水印大小seekBar.setMax(299)
          水印大小seekBar.setProgress(数据列表0.水印大小)
          --绑定监听
          水印大小seekBar.setOnSeekBarChangeListener{
            onStartTrackingTouch=function()
              --开始拖动
            end,
            onStopTrackingTouch=function()
              --停止拖动
            end,
            onProgressChanged=function()
              --状态改变
              水印大小textView.text="水印大小："..tostring(水印大小seekBar.getProgress()+1)
            end}
          水印大小textView.text="水印大小："..tostring(水印大小seekBar.getProgress()+1)
          拖动条颜色(水印大小seekBar,Color.parseColor(强调色))
         elseif 内容=="获取相机信息" then
          提示(parameters.flatten())
         elseif 内容=="设置相机API" then
          pop=PopupMenu(activity,设置相机API)
          menu=pop.Menu
          menu.add("Camera2").onMenuItemClick=function(a)
            数据列表0.是否启用C2=true
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            activity.newActivity('main2')
            activity.finish()
          end
          menu.add("Camera1").onMenuItemClick=function(a)
            数据列表0.是否启用C2=false
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            activity.newActivity('main')
            activity.finish()
          end
          pop.show()--显示@音六站长～
         elseif 内容=="打开 Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理" or
          内容=="关闭 Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理" then
          if 是否软件内处理图像标题.Text=="打开 Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理" then
            数据列表0.是否软件内处理图像=true
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            是否软件内处理图像标题.Text="关闭 Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理"
           else
            数据列表0.是否软件内处理图像=false
            写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
            是否软件内处理图像标题.Text="打开 Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理"
          end
         elseif 内容=="导出数据" then
          写入文件("/sdcard/Download/"..os.date("%Y-%m-%d %H:%M:%S").."数据导出.aly",dump(数据列表0))
          print("导出成功")
         elseif 内容=="导入数据" then
          --输入对话框
          InputLayout={
            LinearLayout;
            orientation="vertical";
            Focusable=true,
            FocusableInTouchMode=true,
            {
              EditText;
              hint="路径";
              layout_marginTop="22dp";
              layout_marginBottom="22dp";
              layout_margin="10dp";
              layout_width="fill";
              layout_gravity="center",
              id="edit";
              --text=数据列表0.保存位置
              --Typeface=字体("Product");
            };
          };
          dialog=AlertDialog.Builder(this)
          .setTitle("导入数据")
          .setView(loadlayout(InputLayout))
          .setPositiveButton("确定",{onClick=function(v)
              数据列表0=string2tab(io.open(edit.Text):read("*a"))
              写入文件("/sdcard/Android/data/"..activity.getPackageName().."/data.aly",dump(数据列表0))
              print("导入成功")
            end})
          .setNegativeButton("取消",nil)
          .show()
          DialogButtonFilter(dialog)
         elseif 内容=="关于" then
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
        end
      end,
      {
        TextView;
        -- layout_width='wrap';
        layout_height='fill';
        layout_marginLeft='22dp';
        layout_margin='16dp';
        Gravity='left|center';
        textColor=0xffffffff;
        text=内容;
        id=TextViewid,
        textSize='16sp';
      };
    };
  end
  function 加载列表()
    if 数据列表0.参考线 then
      参考线前="关闭"
     else
      参考线前="打开"
    end
    if 数据列表0.零延时拍照 then
      零延时拍照前="关闭"
     else
      零延时拍照前="打开"
    end
    if 数据列表0.是否软件内处理图像 then
      是否软件内处理图像前="关闭"
     else
      是否软件内处理图像前="打开"
    end
    数据列表={"设置图像分辨率",
      "设置视频分辨率",
      参考线前.."参考线",
      "设置保存位置",
      "图像格式",
      "图像质量",
      "防牛顿环配置",
      零延时拍照前.."零延时拍照(使用Camera2时不起作用)",
      是否软件内处理图像前.." Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理",
      "设置水印",
      "设置相机API",
      "获取相机信息",
      "导出数据",
      "导入数据",
      "关于"}
    for d,内容 in pairs(数据列表) do
      if 是否c2=="否" then
        if (内容==是否软件内处理图像前.." Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理")==false then
          内容填充器.addView(loadlayout(添加布局(内容)))
        end
       elseif 内容=="获取相机信息" then
       elseif 内容==是否软件内处理图像前.." Camera2在拍摄时捕捉一张RAW图片并在本软件中自动处理不由系统处理" then
        if 是否支持RAW then
          内容填充器.addView(loadlayout(添加布局(内容)))
        end
       else
        内容填充器.addView(loadlayout(添加布局(内容)))
      end
    end
  end
  加载列表()
end

