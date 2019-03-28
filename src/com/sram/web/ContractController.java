package com.sram.web;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.model.FieldsDocumentPart;
import org.apache.poi.hwpf.usermodel.Field;
import org.apache.poi.hwpf.usermodel.Fields;
import org.apache.poi.hwpf.usermodel.Range;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping(value = "/contract",method = {RequestMethod.GET,RequestMethod.POST})
public class ContractController {

    @RequestMapping("/look")
    public String look(HttpServletRequest request){
        Map<String, String> map = new HashMap<String, String>();
        map.put("${name}", "王佳璐");
        map.put("${id}", "1");
        String srcPath = "E:/JavaCode/hrms_ssm/web/static/contract/contract.doc";
        String str = readwriteWord(srcPath, map);
        request.setAttribute("str", str);
        return "admin/contract/look";
    }
    public String readwriteWord(String filePath, Map<String, String> map){
        FileInputStream in = null;
        try
        {
            in = new FileInputStream(new File(filePath));
        }
        catch (FileNotFoundException e1)
        {
            e1.printStackTrace();
        }
        HWPFDocument hdt = null;
        try
        {
            hdt = new HWPFDocument(in);
        }
        catch (IOException e1)
        {
            e1.printStackTrace();
        }
        Fields fields = hdt.getFields();
        Iterator<Field> it = fields.getFields(FieldsDocumentPart.MAIN)
                .iterator();
        while (it.hasNext())
        {
            System.out.println(it.next().getType());
        }
        //读取word文本内容
        Range range = hdt.getRange();
        // 替换文本内容
        for (Map.Entry<String, String> entry : map.entrySet())
        {
            range.replaceText(entry.getKey(), entry.getValue());
        }

        return range.text();
    }

}
