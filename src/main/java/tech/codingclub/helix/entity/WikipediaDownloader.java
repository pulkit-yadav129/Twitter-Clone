package tech.codingclub.helix.entity;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import tech.codingclub.helix.global.HttpURLConnectionExample;

import java.io.IOException;

public class WikipediaDownloader {
    private String keyword;
    public WikipediaDownloader()
    {

    }

    public WikipediaDownloader(String keyword) {
        this.keyword = keyword;
    }




    public WikiResult getResult() {
        if(this.keyword==null)
        {
            return null;
        }
        this.keyword=this.keyword.trim().replaceAll("[ ]+","_");
        String response="";
        String imageURL = "";
        String wikiUrl=getWikipediaUrlForQuery(this.keyword);
        try {
            String wikipediaResponse= HttpURLConnectionExample.sendGet(wikiUrl);
           // System.out.println(wikipediaResponse);

            Document document= Jsoup.parse(wikipediaResponse,"https://en.wikipedia.org");
            Elements childElements=document.body().select(".mw-parser-output > *");
            int state=0;

            for(Element childElement:childElements)
            {
                if(state==0)
                {
                    if(childElement.tagName().equals("table"))
                    {
                        state=1;
                    }
                }
                else if(state==1)
                {
                    if(childElement.tagName().equals("p"))
                    {
                        state=2;
                        response=childElement.text();
                        break;
                    }
                }
            }
            try{
               imageURL= document.body().select(".infobox img").get(0).attr("src");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(imageURL.startsWith("//"))
        {
            imageURL="https:"+imageURL;
        }
        WikiResult wikiResult=new WikiResult(this.keyword,response,imageURL);
        return wikiResult;



    }

    private String getWikipediaUrlForQuery(String cleanKeyword) {
        return "https://en.wikipedia.org/wiki/"+cleanKeyword;
    }


}
