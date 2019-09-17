# 注音经咒--文字编码说明



> 该文档解释了这款软件如何编码以及呈现诸文字
>
> :information_source:当前版本  v1.0



### 1. 文档版本以及历史

| 版本 | 更新时间  | 改变 |
| ---- | --------- | ---- |
| v1.0 | 2019/9/17 | 原稿 |



### 2. 解释器运行原理

各个经咒以压缩的方式被存储在手机内存中，软件持有各个经咒的元信息，通过标题拿到该经咒句柄，然后软件会解压成字符串，然后解析字符串之后再呈现出来。



比如对于`<0<10书籍题目>10<20佚名>20<12第一品>12<33>33<35这里是正文>35>0`，解释器会渲染成如下格式文本：

<div style="font-family:宋体">
    <center>
        <h1>
    		书籍题目
    	</h1>
    </center>
    <center>
        <h3>
            佚名&ensp;&ensp;译
        </h3>
    </center>
    <left>
        <h4>
            第一品
        </h4>
    </left>
    <br />
    <p>
        &ensp;&ensp;&ensp;&ensp;这里是正文
    </p>
</div>





### 3. 具体编码

|                 名称 | 编码 |
| -------------------: | :--- |
|             一部经咒 | 00   |
|             **题**目 |      |
|     一部完整的经咒题 | 10   |
|                 卷题 | 11   |
|                 品题 | 12   |
|     经中小咒或者偈题 | 13   |
|             **名称** |      |
|                 译者 | 20   |
|                 圣号 | 21   |
|             **文字** |      |
|     整齐呈现的偈、咒 | 30   |
| 不会整齐呈现的偈、咒 | 31   |
|                 空格 | 32   |
|                 空行 | 33   |
|                 提示 | 34   |
|             经文内容 | 35   |
|             **格式** |      |
|             新页展示 | 40   |



### 4. 说明

1. **编码方式** `<` + 编码 + 内容或者嵌套编码的内容 + `<` + 编码，如  <0<10书题<10<0
2. 拼音直接跟在文字后面，使用`#`标识，如  分#fēn#神#shén#
3. 想要显示`<`和`#`，使用 << 和 <# 