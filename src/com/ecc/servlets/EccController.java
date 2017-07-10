package com.ecc.servlets;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.backblaze.erasure.SampleDecoder;
import com.backblaze.erasure.SampleEncoder;


/**
 * Servlet implementation class EccController
 */
//@WebServlet("/EccController")
public class EccController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EccController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("asdfasdfasdfasdfsd");
		String url =request.getRequestURI();
		//System.out.println("HELLO"+url);
		if(url.endsWith("getMainPage.action")){
			request.getRequestDispatcher("mainpage.jsp").forward(request, response);
		}
		if(url.endsWith("addobject.action")){
			
			request.getRequestDispatcher("pageBasicAlgorithm.jsp").forward(request, response);
		}
		if(url.endsWith("redistribute.action")){
			
			distributeObjectsToTable(request, response);
		}
		
		if(url.endsWith("splitobject.action")){
			
			splitObject(request, response);
		}
		
		
if(url.endsWith("decodeobject.action")){
			
			decodeObject(request, response);
		}
		
		if(url.endsWith("addobjecttotable.action")){
			addObjectsToTable(request, response);
		}
		if(url.endsWith("ec_cache_inter_structure.action")){
			
			request.getRequestDispatcher("ec_cache_internal.jsp").forward(request, response);
		}
		if(url.endsWith("results.action")){
			
			request.getRequestDispatcher("results.jsp").forward(request, response);
		}
		
	}

	private void decodeObject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       String file1= request.getParameter("fileName1");		
       String file2= request.getParameter("fileName2");
       String file3= request.getParameter("fileName3");
       String file4= request.getParameter("fileName4");
       System.out.println("file2" +file1 +file2+file3+file4);
       String files[]={"encode"};
       SampleDecoder decoder=new  SampleDecoder();
       StringBuilder output=new StringBuilder();
       decoder.decoder(files, output);
       System.out.println("RETURNED"+output);
       request.setAttribute("output", output.toString()); 
       request.getRequestDispatcher("decodedObjects.jsp").forward(request, response);
		
	}

	private void splitObject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	      String input=request.getParameter("split_input");
	      System.out.println("INPUT VALUE"+input);
	      BufferedWriter bw = null;
			FileWriter fw = null;
	      try {
	    	  ServletConfig scfg= getServletConfig();
	    	  ServletContext scxt = scfg.getServletContext();
	    	//  String path=scxt.getRealPath("/WEB-INF/");
	    	  //String path="/home/sriharsha/workspace_Neon/SER/ECC"
	    	//  System.out.println(path);
				fw = new FileWriter("/home/sriharsha/workspace_Neon/SER/ECC"+"/encode");
				bw = new BufferedWriter(fw);
				bw.write(input);
               
				System.out.println("Done");

			} catch (IOException e) {

				e.printStackTrace();

			}finally {

				try {

					if (bw != null)
						bw.close();

					if (fw != null)
						fw.close();

				} catch (IOException ex) {

					ex.printStackTrace();

				}
			}

	      SampleEncoder encoder=new SampleEncoder();
          String [] encodeFile={"encode"};
          String [] split_String= new String[6];
          Arrays.fill(split_String, "");
          encoder.Encode(encodeFile,split_String);
           for(String s:split_String){
        	   System.out.println(" "+s);
           }
          request.setAttribute("split_String", split_String); 
          request.getRequestDispatcher("split_obj.jsp").forward(request, response);
		
	}

	private void distributeObjectsToTable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> selmap1 ,selmap2,selmap3,selmap4,selmap5,selmap6;
		Map<String, String> ecmap1 ,ecmap2,ecmap3,ecmap4,ecmap5,ecmap6;
		
		//System.out.println("INSIDE distributeObjectsToTable function" );
		selmap1=(Map<String, String>) request.getSession().getAttribute("selmap1");
		selmap2=(Map<String, String>) request.getSession().getAttribute("selmap2");
		selmap3=(Map<String, String>) request.getSession().getAttribute("selmap3");
		selmap4=(Map<String, String>) request.getSession().getAttribute("selmap4");
		selmap5=(Map<String, String>) request.getSession().getAttribute("selmap5");
		selmap6=(Map<String, String>) request.getSession().getAttribute("selmap6");
		
		ecmap1=(Map<String, String>) request.getSession().getAttribute("ecmap1");
		ecmap2=(Map<String, String>) request.getSession().getAttribute("ecmap2");
		ecmap3=(Map<String, String>) request.getSession().getAttribute("ecmap3");
		ecmap4=(Map<String, String>) request.getSession().getAttribute("ecmap4");
		ecmap5=(Map<String, String>) request.getSession().getAttribute("ecmap5");
		ecmap6=(Map<String, String>) request.getSession().getAttribute("ecmap6");
		 
		String objectId=request.getParameter("objectid");
	  if(objectId.equalsIgnoreCase("DOWN")){	
		
	//	int size_selmap3=selmap3.size()/2;
		int flag=0;
		for (Map.Entry<String, String> entry : selmap6.entrySet()) {
			  /*if(flag<size_selmap3){
				  if(selmap1.containsKey(entry.getKey())){
					  
					  int value=Integer.parseInt(entry.getValue());
					  int initialvalue= Integer.parseInt(selmap1.get(entry.getKey()));
					  int updateValue=value+initialvalue;
				     selmap1.put(entry.getKey(), ""+updateValue);
				     flag++;
				  } 
			  }
			else {
				if (selmap2.containsKey(entry.getKey())) {

					int value = Integer.parseInt(entry.getValue());
					int initialvalue = Integer.parseInt(selmap2.get(entry.getKey()));
					int updateValue = value + initialvalue;
					selmap2.put(entry.getKey(), "" + updateValue);
				}
			}*/	
			if(selmap1.containsKey(entry.getKey())){
				int updateValue = updateTable(selmap1, entry);
			     selmap1.put(entry.getKey(), ""+updateValue);
				
			}
			else if(selmap2.containsKey(entry.getKey())){
				int updateValue = updateTable(selmap2, entry);
				selmap2.put(entry.getKey(), ""+updateValue);
			}
			else if(selmap3.containsKey(entry.getKey())){
				int updateValue = updateTable(selmap3, entry);
				selmap3.put(entry.getKey(), ""+updateValue);
			}
			else if(selmap4.containsKey(entry.getKey())){
				int updateValue = updateTable(selmap4, entry);
				selmap4.put(entry.getKey(), ""+updateValue);
			}
			else if(selmap5.containsKey(entry.getKey())){
				int updateValue = updateTable(selmap5, entry);
				selmap5.put(entry.getKey(), ""+updateValue);
			}

			}
		 selmap6.clear();    
		 selmap6.put("DN","DN"); 
	  }
	  else{
		  selmap6.clear();  
	  }
		request.getSession().setAttribute("selmap1", selmap1);
		request.getSession().setAttribute("selmap2", selmap2);
		request.getSession().setAttribute("selmap3", selmap3);
		request.getSession().setAttribute("selmap4", selmap4);
		request.getSession().setAttribute("selmap5", selmap5);
		request.getSession().setAttribute("selmap6", selmap6);
		
		request.getSession().setAttribute("ecmap1", ecmap1);
		request.getSession().setAttribute("ecmap2", ecmap2);
		request.getSession().setAttribute("ecmap3", ecmap3);
		request.getSession().setAttribute("ecmap4", ecmap4);
		request.getSession().setAttribute("ecmap5", ecmap5);
		request.getSession().setAttribute("ecmap6", ecmap6);
		  if(objectId.equalsIgnoreCase("DOWN")){	
		request.getRequestDispatcher("ServerAlloc.jsp").forward(request, response);}
		  else{
			  request.getRequestDispatcher("ServerAlloc.jsp").forward(request, response);
		  }
		
	}

	private int updateTable(Map<String, String> selmap1, Map.Entry<String, String> entry) {
		int value=Integer.parseInt(entry.getValue());
		  int initialvalue= Integer.parseInt(selmap1.get(entry.getKey()));
		  int updateValue=value+initialvalue;
		return updateValue;
	}

	private void addObjectsToTable(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> selmap1 ,selmap2,selmap3,selmap4,selmap5,selmap6;
		Map<String, String> ecmap1 ,ecmap2,ecmap3,ecmap4,ecmap5,ecmap6;
		if(request.getSession().getAttribute("selmap1")==null&& 
				request.getSession().getAttribute("selmap2")==null&& 
				request.getSession().getAttribute("selmap3")==null&&
				request.getSession().getAttribute("selmap4")==null&&
				request.getSession().getAttribute("selmap5")==null&&
				request.getSession().getAttribute("selmap6")==null){
		   selmap1=new TreeMap<String, String>();
		   selmap2=new TreeMap<String, String>();
		   selmap3=new TreeMap<String, String>();
		   selmap4=new TreeMap<String, String>();
		   selmap5=new TreeMap<String, String>();
		   selmap6=new TreeMap<String, String>();
		}else{
			selmap1=(Map<String, String>) request.getSession().getAttribute("selmap1");
			selmap2=(Map<String, String>) request.getSession().getAttribute("selmap2");
			selmap3=(Map<String, String>) request.getSession().getAttribute("selmap3");
			selmap4=(Map<String, String>) request.getSession().getAttribute("selmap4");
			selmap5=(Map<String, String>) request.getSession().getAttribute("selmap5");
			selmap6=(Map<String, String>) request.getSession().getAttribute("selmap6");
		}
		if(request.getSession().getAttribute("ecmap1")==null&& 
				request.getSession().getAttribute("ecmap2")==null&& 
				request.getSession().getAttribute("ecmap3")==null&&
				request.getSession().getAttribute("ecmap4")==null&&
				request.getSession().getAttribute("ecmap5")==null&&
				request.getSession().getAttribute("ecmap6")==null){
			ecmap1=new TreeMap<String, String>();
			ecmap2=new TreeMap<String, String>();
			ecmap3=new TreeMap<String, String>();
			ecmap4=new TreeMap<String, String>();
			ecmap5=new TreeMap<String, String>();
			ecmap6=new TreeMap<String, String>();
			
		}else{
			ecmap1=(Map<String, String>) request.getSession().getAttribute("ecmap1");
			ecmap2=(Map<String, String>) request.getSession().getAttribute("ecmap2");
			ecmap3=(Map<String, String>) request.getSession().getAttribute("ecmap3");
			ecmap4=(Map<String, String>) request.getSession().getAttribute("ecmap4");
			ecmap5=(Map<String, String>) request.getSession().getAttribute("ecmap5");
			ecmap6=(Map<String, String>) request.getSession().getAttribute("ecmap6");
		}
		String objectId=request.getParameter("objectid");
		String objectPrity=request.getParameter("objectprity");
		String cacheType=request.getParameter("cachetype");
		String objectfreq=request.getParameter("objectfreq"); 
		
		 ArrayList<Integer> randomList=new ArrayList<Integer>();
		 for(int i=0;i<6;i++){
			 randomList.add(new Integer(i));
		 }
		 Collections.shuffle(randomList);	
   if(cacheType.equalsIgnoreCase("select")){
	   
	   //Generation of Unique Random Numbers b/w two numbers.
	  
	   //For Selective priority 4:
	  /* List<Map<String, String>> list4 =new ArrayList<Map<String,String>>();
	   if(selmap3.size()==1&&("DN").equalsIgnoreCase(selmap3.get("DN"))){
	   list4.add(selmap1); list4.add(selmap2); list4.add(selmap4);
	   }else{
		   list4.add(selmap1); list4.add(selmap2);list4.add(selmap3); list4.add(selmap4);
	   }
		   //For Selective priority 3:
		   List<Map<String, String>> list3 =new ArrayList<Map<String,String>>();
		   if(selmap3.size()==1&&("DN").equalsIgnoreCase(selmap3.get("DN"))){
		   list3.add(selmap1); list3.add(selmap2);
		   }else{
			   list3.add(selmap1); list3.add(selmap2);list3.add(selmap3); 
		   }
		   
		   //For Selective Priority 2:
		   List<Map<String, String>> list2 =new ArrayList<Map<String,String>>();
		   list2.add(selmap1); list2.add(selmap2);
		   
		   
		   //For Priority 1:
		   
		   List<Map<String, String>> list1 = new ArrayList<Map<String,String>>();
		   list1.add(selmap1);
		   
		   
		   
		   */	
		   request.setAttribute("objectid", objectId);
		   request.setAttribute("objectprity", objectPrity);
		   request.setAttribute("cachetype", cacheType);
	  
		  boolean flag=false;
		  /*if(selmap6.size()==1&&selmap3.get("DN").equalsIgnoreCase("DN"))
			   flag=true;*/
			  
		   
		  /* if(Integer.parseInt(objectPrity)==4){
			   replicationInSelectiveModel(objectId,objectPrity,cacheType,list4,objectfreq,flag);
		   }
		   if(Integer.parseInt(objectPrity)==3){
			   replicationInSelectiveModel(objectId,objectPrity,cacheType,list3,objectfreq,flag);
		   }
		   if(Integer.parseInt(objectPrity)==2){
			   replicationInSelectiveModel(objectId,objectPrity,cacheType,list2,objectfreq,flag);
		   }
		   if(Integer.parseInt(objectPrity)==1){
			   replicationInSelectiveModel(objectId,objectPrity,cacheType,list1,objectfreq,flag);
		   }*/
		 List<Map<String, String>> selectionReplicationMaps =new ArrayList<Map<String,String>>();
		 for(int i=0;i<Integer.parseInt(objectPrity);i++){
			 int j=randomList.get(i);
			 switch (j) {
			case 0: selectionReplicationMaps.add(selmap1);
				
				break;
			case 1:selectionReplicationMaps.add(selmap2);
				
				break;

			case 2: selectionReplicationMaps.add(selmap3);
	
				break;

			case 3:selectionReplicationMaps.add(selmap4);
	
				break;

			case 4:selectionReplicationMaps.add(selmap5);
	
				break;

			case 5: if(("DN").equalsIgnoreCase(selmap6.get("DN"))){
				selectionReplicationMaps.add(selmap5);
					}else{
				    selectionReplicationMaps.add(selmap6);}
				break;
			}
			 
		 }
		 replicationInSelectiveModel(objectId,objectPrity,cacheType,selectionReplicationMaps,objectfreq,flag);
		   
		   
   }else if (cacheType.equalsIgnoreCase("eccache")) {
		   int number;
		   if(request.getSession().getAttribute("random") == null){
		   	 number=1;
		   request.getSession().setAttribute("random", number);
		   }
		   	else {
		   		  int one;
		   		  one=(Integer) request.getSession().getAttribute("random");
		   		  request.getSession().setAttribute("random", one+1);
		   	} 
		   	
		   
		/*   if(request.getAttribute("random")==null){
			   Random random=new Random(1234);
		   number=random.nextInt(10000000);
		   }else{
			   
			   int number1=Integer.parseInt(request.getParameter("number"));
			   System.out.println("Random number"+number1);
			   Random random=new Random(number1);
			   number=random.nextInt(10000000);
		   }*/
		  int randomNUmber=(Integer) request.getSession().getAttribute("random");
		    if(Integer.parseInt(objectfreq)<=5){
		    	int k=randomList.get(0);
		    	switch (k) {
				case 0: ecmap1.put(objectId, ""+objectfreq);
					
					break;
				case 1: ecmap2.put(objectId, ""+objectfreq);
					
					break;

				case 2:ecmap3.put(objectId, ""+objectfreq);
		
					break;

				case 3:ecmap4.put(objectId, ""+objectfreq);
		
					break;

				case 4:ecmap5.put(objectId, ""+objectfreq);
		
					break;

				case 5:ecmap6.put(objectId, ""+objectfreq);
					break;
				}	
		    	
		    }
		    else{
		  
		  
		  int noOfObjectsDistributed=Integer.parseInt(objectfreq)/6;
		     int extraRequests=noOfObjectsDistributed* 6;
		     int remainingRequest=Integer.parseInt(objectfreq)-extraRequests;
		       ecmap1.put(objectId, ""+noOfObjectsDistributed);
		       ecmap1.put(objectId, ""+noOfObjectsDistributed); 		     
		       ecmap2.put(objectId, ""+noOfObjectsDistributed);
			   ecmap3.put(objectId, ""+noOfObjectsDistributed); 
			   ecmap4.put(objectId, ""+noOfObjectsDistributed); 		     
		       ecmap5.put(objectId, ""+noOfObjectsDistributed);
			   ecmap6.put(objectId, ""+noOfObjectsDistributed); 
			   int k=randomList.get(0);
			   switch (k) {
				case 0: String objectFreq = ecmap1.get(objectId);
					    ecmap1.put(objectId, ""+(Integer.parseInt(objectFreq)+remainingRequest));
					
					break;
				case 1:String objectFreq1 = ecmap1.get(objectId);
			    ecmap2.put(objectId, ""+(Integer.parseInt(objectFreq1)+remainingRequest));
					
					break;

				case 2: String objectFreq2 = ecmap1.get(objectId);
			    ecmap3.put(objectId, ""+(Integer.parseInt(objectFreq2)+remainingRequest));
		
					break;

				case 3:String objectFreq3 = ecmap1.get(objectId);
			    ecmap4.put(objectId, ""+(Integer.parseInt(objectFreq3)+remainingRequest));
		
					break;

				case 4:String objectFreq4 = ecmap1.get(objectId);
			    ecmap5.put(objectId, ""+(Integer.parseInt(objectFreq4)+remainingRequest));
		
					break;

				case 5:String objectFreq5 = ecmap1.get(objectId);
			    ecmap6.put(objectId, ""+(Integer.parseInt(objectFreq5)+remainingRequest));
					break;
				}		   
		    }
//		  if(randomNUmber%2==0){
//			   ecmap1.put(objectId, objectPrity);
//			   ecmap2.put(objectId, objectPrity);
//			   ecmap3.put(objectId, objectPrity); 
//		   }
//		   else{
//			   ecmap2.put(objectId, objectPrity);
//			   ecmap3.put(objectId, objectPrity);
//			   ecmap4.put(objectId, objectPrity);
//		   }
		   
//	   request.getSession().setAttribute("random", number);
}
   
		
		request.getSession().setAttribute("selmap1", selmap1);
		request.getSession().setAttribute("selmap2", selmap2);
		request.getSession().setAttribute("selmap3", selmap3);
		request.getSession().setAttribute("selmap4", selmap4);
		request.getSession().setAttribute("selmap5", selmap5);
		request.getSession().setAttribute("selmap6", selmap6);
		
		request.getSession().setAttribute("ecmap1", ecmap1);
		request.getSession().setAttribute("ecmap2", ecmap2);
		request.getSession().setAttribute("ecmap3", ecmap3);
		request.getSession().setAttribute("ecmap4", ecmap4);
		request.getSession().setAttribute("ecmap5", ecmap5);
		request.getSession().setAttribute("ecmap6", ecmap6);
		request.getRequestDispatcher("ServerAlloc.jsp").forward(request, response);
	}

	private void replicationInSelectiveModel(String objectId, String objectPrity, String cacheType,
			List<Map<String, String>> list3, String objectfreq, boolean isS6DN) {
		     int noOfObjectsDistributed=Integer.parseInt(objectfreq)/list3.size();
		     int extraRequests=noOfObjectsDistributed* list3.size();
		     int remainingRequest=Integer.parseInt(objectfreq)-extraRequests;
		     int flag=0;
		    for(Map<String, String> map:list3){
		    	// int requestNumber=extraRequests+remainingRequest;
		    	 if(remainingRequest>0&&flag==0){
		    		 int objectAppend=noOfObjectsDistributed+remainingRequest; 
		    		 map.put(objectId/*+""+"NReq:"+objectPrity*/, ""+objectAppend);
		    		 flag=1;
		    	 }	 
			     
		    	 else
		    		 map.put(objectId/*+""+"NReq:"+objectPrity*/, ""+noOfObjectsDistributed);	 
		    	
		    }
		
	}

}
