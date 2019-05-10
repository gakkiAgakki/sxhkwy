package com.sxhkwy.utils;

/**
 * 判断是否为图片
 * Created by HASEE on 2019/4/23.
 */
public class IsPicture {
    /**
     *
     * @param pinput 文件名
     * @param pImgFlag 判断具体文件类型
     * @return 判断后的结果
     * @throws Exception
     */
    public static boolean isPicture(String pinput,String pImgFlag) throws Exception{
        //文件名称为空的场合,
        if (pinput == null){
            //返回false
            return false;
        }
        //获得文件后缀名
        String tmpName = pinput.substring(pinput.lastIndexOf(".") + 1, pinput.length());
        //声明图片后缀名数组
        String imgArray[][] = {
                {"bmp","0"},{"dib","1"},{"gif","2"},{"jfif","3"},{"jpe","4"},{"jpeg","5"},
                {"jpg","6"},{"png","7"},{"tif","8"},{"tiff","9"},{"ico","10"}
        };
        //遍历名称数组
        for (int i = 0;i<imgArray.length;i++){
            //判断单个类型的文件
            if (pImgFlag != null && imgArray[i][0].equals(tmpName.toLowerCase()) && imgArray[i][1].equals(pImgFlag)){
                return true;
            }
            //判断符合全部类型的
            if (pImgFlag == null && imgArray[i][0].equals(tmpName.toLowerCase())){
                return true;
            }
        }

        return false;
    }

}
