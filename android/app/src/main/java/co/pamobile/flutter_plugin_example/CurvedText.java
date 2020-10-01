package co.pamobile.flutter_plugin_example;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Typeface;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

import java.util.Map;

public class CurvedText extends View {
    private Paint mPaint;
    private Paint mPaintBorder;

    private Path mPath;
    private Paint mPathPaint;
    private Map size;
    private Typeface mFont;
    float superSetTextSize = 0;

    public String getTextOnPath() {
        return textOnPath;
    }

    public void setTextOnPath(String textOnPath, float textSize) {
        this.textOnPath = textOnPath;
        this.superSetTextSize = textSize;
    }
    public void setSize(Map size){
        this.size = size;
    }

    public void setTextOnPath(String textOnPath) {
        this.textOnPath = textOnPath;
    }

    private String textOnPath = "Card Name";

    float scaleRatio = 1;

    private void makePath(Path p,float scaleRatio, String cardType) {
       // Log.e("makePath",getWidth() +" --- "+ getHeight());
//        Log.e("e",size.get("x1").toString());
        switch (cardType){
            case "minion":
                if(size == null || size.isEmpty()){
                    p.moveTo(0, getHeight()*0.84f);

                    p.cubicTo(getWidth()*0.23f, getHeight()*1.25f, getWidth()*0.70f, getHeight()*0.20f, getWidth() * 1, getHeight() * 0.82f);//small
                }else{
                    p.moveTo(getWidth() *Float.parseFloat(size.get("x0").toString()) , getHeight()*Float.parseFloat(size.get("y0").toString()));

                    p.cubicTo(getWidth()*Float.parseFloat(size.get("x1").toString()), getHeight()*Float.parseFloat(size.get("y1").toString()), getWidth()* Float.parseFloat(size.get("x2").toString()), getHeight()* Float.parseFloat(size.get("y2").toString()), getWidth() * Float.parseFloat(size.get("x3").toString()), getHeight() * Float.parseFloat(size.get("y3").toString()));//small
                }

//                p.moveTo(0, 5*scaleRatio);
//                p.cubicTo(30*scaleRatio, 20*scaleRatio, 195*scaleRatio, -45*scaleRatio, 248*scaleRatio, 5*scaleRatio);//small
                break;
            case "spell":
                p.moveTo(0, getHeight()*0.75f);
                p.cubicTo(getWidth()*0.25f, getHeight()*0.25f, getWidth()*0.75f, getHeight()*0.25f, getWidth(), getHeight()*0.75f);//small
//                p.moveTo(0, 10*scaleRatio);
//                p.cubicTo(62*scaleRatio, -20*scaleRatio, 186*scaleRatio, -20*scaleRatio, 248*scaleRatio, 10*scaleRatio);//small
                break;
            case "hero":
                p.moveTo(0, getHeight()*0.9f);
                p.cubicTo(getWidth()*0.25f, getHeight()*0.25f, getWidth()*0.75f, getHeight()*0.25f, getWidth(), getHeight()*0.9f);//small
                break;
        }

//        p.moveTo(0, getHeight()*0.75f);
//        p.cubicTo(getWidth()*0.25f, getHeight()*1.25f, getWidth()*0.75f, getHeight()*0.25f, getWidth(), getHeight()/2f);//small
    }


    public CurvedText(Context context, float scaleRatio, String cardType) {
        super(context);
        init(scaleRatio,cardType);
    }

    void init(float scaleRatio, String cardType){
        setFocusable(true);
        this.scaleRatio = scaleRatio;
//        Typeface tfbbbb = Typeface.createFromAsset(context.getAssets(),
//                "font/Belwe-bd-bt-bold.ttf");
//        this.mFont = tfbbbb;
        //allocate resource, avoid allocate in onDraw\
        mPaintBorder = new Paint();
        mPaint = new Paint();
        mPath = new Path();
        makePath(mPath, scaleRatio, cardType);
        mPathPaint = new Paint();
        mPathPaint.setAntiAlias(true);
        mPathPaint.setColor(Color.RED);
        mPathPaint.setStyle(Paint.Style.STROKE);
    }



    @Override
    protected void onDraw(Canvas canvas) {
        canvas.drawColor(Color.argb(80,33,33,55));
      //  canvas.translate(0, 40 * scaleRatio);
        canvas.drawPath(mPath, mPathPaint);
        mPaintBorder.setStyle(Paint.Style.STROKE);
        mPaintBorder.setStrokeWidth(12f);
        mPaintBorder.setColor(Color.BLACK);
        mPaintBorder.setTextSize(superSetTextSize);

        mPaintBorder.setAntiAlias(true);
        mPaintBorder.setStrokeJoin(Paint.Join.ROUND);
        mPaintBorder.setStrokeMiter(10f);
        mPaintBorder.setTextAlign(Paint.Align.CENTER);
        canvas.drawTextOnPath(textOnPath, mPath, 0, 0, mPaintBorder);
        super.onDraw(canvas);
        mPaint.setStyle(Paint.Style.FILL);
        mPaint.setStrokeWidth(0f);
        mPaint.setColor(Color.WHITE);
        mPaint.setTextSize(superSetTextSize);

        mPaint.setAntiAlias(true);
        mPaint.setStrokeJoin(Paint.Join.ROUND);
        mPaint.setStrokeMiter(10f);
        mPaint.setTextAlign(Paint.Align.CENTER);
        canvas.drawTextOnPath(textOnPath, mPath, 0, 0, mPaint);

        super.onDraw(canvas);
    }

}