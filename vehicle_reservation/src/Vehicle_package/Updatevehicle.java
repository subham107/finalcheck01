package Vehicle_package;

import java.io.IOException;
import java.io.PrintWriter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * Servlet implementation class Updatevehicle
 */
@WebServlet("/Updatevehicle")
public class Updatevehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatevehicle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try
		{
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		ServletContext sc=request.getServletContext();
		String vehicleno=(String) sc.getAttribute("vno");
		//String vehicleno=request.getParameter("vno");
		System.out.println(vehicleno);
		int choice=Integer.parseInt(request.getParameter("choice"));
		//System.out.println(choice);
		String data=request.getParameter("data");
		//DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
		//Date d=(Date) df.parse(date);
		//System.out.println(d);
		int status= VehicleDAO.UpdateVehicleDetails(choice,data,vehicleno);
		if(status>0)
		{
			out.println("<script>alert('Updated Successfully')</script>");
			//request.getRequestDispatcher("Updatevehicle.jsp").include(request,response);
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			Date dd=new Date();
			ArrayList<Vehicle> list=new ArrayList<Vehicle>();
			Vehicle p=new Vehicle();
			list=VehicleDAO.updatedisplay(vehicleno);
			out.print("<html>");
			out.print("");
			out.println("<head>");
			out.println("<style>");
			out.println("body{");
			out.println("background-color:#2c3335");
			out.println("}");
			out.println("h1{");
			out.println("color:#f5f5f5");
			out.println("}");
			out.println("table,td,th{");        
		    out.println("border: 1px solid #f5f5f5 ;");
		 	out.println(" padding: 3px;");
			  out.println("}");
			  out.println("table {");
			  out.println("border-spacing: 15px;");
			  out.println("}");
			  out.println("</style>");
			  out.println("</head>");
			  out.println("<body>");
			  out.print("<center>");
			  out.print("<h2>Updated Vehicle Details</h2>");
			  out.print("</center>");
			out.print("<table width='100%'");
			out.print("<tr><th>Vehicle No</th><th>Branch</th><th>Vehicle Type</th><th>Insurance Expiry Date</th><th>Last Serviced Date</th><th>Service Due Date</th></tr>");
			for(Vehicle vv:list)
			{
				String d1=vv.getInsurance_expiry();
				Date d = null;
				try
				{
					d = (Date) df.parse(d1);
				} 
				catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				//System.out.println("display details : date2="+dd);
				//System.out.println("difference : "+(dd.getDate()-d.getDate()));
			long duration=d.getTime()-dd.getTime();
			   long datedifference=TimeUnit.MILLISECONDS.toDays(duration);
			   System.out.println("Total number of days : "+datedifference);
				if(datedifference<=15)
				{
				   out.print("<tr style='color:red;'><td>"+vv.getVehicleno()+"</td><td>"+vv.getBranch()+"</td><td>"+vv.getVehicletype()+"</td><td>"+vv.getInsurance_expiry()+"</td><td>"+vv.getLast_serviced_date()+"</td><td>"+vv.getService_due_date()+"</td></tr>");
				}
				else
				{
					out.print("<tr><td>"+vv.getVehicleno()+"</td><td>"+vv.getBranch()+"</td><td>"+vv.getVehicletype()+"</td><td>"+vv.getInsurance_expiry()+"</td><td>"+vv.getLast_serviced_date()+"</td><td>"+vv.getService_due_date()+"</td></tr>");
				}
			}
			out.print("</table>");
			out.print("<br>");
			
			out.println("</body>");
			out.println("</html>");
			
		}
		else
		{
			out.println("<script>alert('Error')</script>");
			request.getRequestDispatcher("Updatevehicle.jsp").include(request,response);
		}
		
		}
		catch(Exception e)
		{
			System.out.println("update vehicle.java "+e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
