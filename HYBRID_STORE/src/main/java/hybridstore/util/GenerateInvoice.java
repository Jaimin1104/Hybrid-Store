package hybridstore.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.stream.Stream;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import hybridstore.model.BranchesModel;
import hybridstore.model.CartItemsModel;
import hybridstore.model.CartModel;
import hybridstore.model.ConsumersModel;
import hybridstore.model.OrdersModel;
import hybridstore.model.ProductsModel;
import hybridstore.model.StaffModel;

public class GenerateInvoice 
{
	private static int orderid;
	private static Document doc;
	
	public GenerateInvoice(int oid)
	{
		orderid = oid;
		doc = new Document();
		addContent();
	}
	
	public static void addContent()  
	{   
		OrdersModel order = new OrdersModel().getOrderInformation(orderid);
		ConsumersModel consumer = new ConsumersModel().getOrderConsumer(order.getOrderid());
		StaffModel staff =  new StaffModel().getStaff(order.getStaffid());
		BranchesModel branch = new BranchesModel().getBranch(staff.getBranchid());
		
		try   
		{  
			//generate a PDF at the specified location  
			PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream("E:\\HYBRID_STORE\\src\\main\\webapp\\invoices\\"+ orderid +".pdf"));  
			System.out.println("PDF created.");  
			//opens the PDF  
			doc.open();  
			
			Font font = FontFactory.getFont("PLAY_REGULAR",13,1);
			Chunk chunk = new Chunk("HYBRID STORE", font);
			Paragraph para = new Paragraph(chunk.setCharacterSpacing(1.0f));
			para.setAlignment(Element.ALIGN_CENTER);
			doc.add(para);
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			
			font = FontFactory.getFont("PLAY_REGULAR", 11,0,BaseColor.BLACK);
			para = new Paragraph(new Chunk("ORDERID #"+orderid,font).setCharacterSpacing(0.3f));
			para.setAlignment(Element.ALIGN_RIGHT);
			doc.add(para);
			
			font = FontFactory.getFont("PLAY_REGULAR", 11,0,BaseColor.BLACK);
			String date = "";
			try 
			{
				date = new DateTimeFormat().getDateTimeInFormat(order.getDatetime(), "MMMM dd, yyyy");
			}
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
			para = new Paragraph(new Chunk(date,font).setCharacterSpacing(0.3f));
			para.setAlignment(Element.ALIGN_RIGHT);
			doc.add(para);
			
			font = FontFactory.getFont("PLAY_REGULAR", 13,4,BaseColor.BLACK);
			para = new Paragraph(new Chunk("Consumer Details",font).setCharacterSpacing(1.0f));
			para.setAlignment(Element.ALIGN_LEFT);
			doc.add(para);
			
			doc.add(new Paragraph(" "));
			
			font = FontFactory.getFont("PLAY_REGULAR", 12,BaseColor.BLACK);
			para = new Paragraph(new Chunk(consumer.getFirstname() + " " + consumer.getLastname(),font).setCharacterSpacing(0.5f));
			para.setAlignment(Element.ALIGN_LEFT);
			doc.add(para);
			
			para = new Paragraph(new Chunk(consumer.getEmail(),font).setCharacterSpacing(0.5f));
			para.setAlignment(Element.ALIGN_LEFT);
			doc.add(para);
			
			para = new Paragraph(new Chunk("+91 " + consumer.getPhoneno(),font).setCharacterSpacing(0.5f));
			para.setAlignment(Element.ALIGN_LEFT);
			doc.add(para);
			
			doc.add(new Paragraph(" "));
			
			font = FontFactory.getFont("PLAY_REGULAR", 13,4,BaseColor.BLACK);
			para = new Paragraph(new Chunk("Branch Details",font).setCharacterSpacing(1.0f));
			para.setAlignment(Element.ALIGN_LEFT);
			doc.add(para);
			
			doc.add(new Paragraph(" "));
			
			font = FontFactory.getFont("PLAY_REGULAR", 12,BaseColor.BLACK);
			para = new Paragraph(new Chunk(branch.getBranchname(),font).setCharacterSpacing(0.5f));
			para.setAlignment(Element.ALIGN_LEFT);
			doc.add(para);
			
			para = new Paragraph(new Chunk(branch.getAddress(),font).setCharacterSpacing(0.5f));
			para.setAlignment(Element.ALIGN_LEFT);
			doc.add(para);
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			
			PdfPTable table = new PdfPTable(4);
			addTableHeader(table);
			addRows(table);
			table.setWidthPercentage(100f);
			
			doc.add(table);
			//close the PDF file  
			doc.close();  
		
			//closes the writer  
			writer.close();  
		}   
		catch (DocumentException e)  
		{  
			e.printStackTrace();  
		}   
		catch (FileNotFoundException e)  
		{  
			e.printStackTrace();  
		}
	}

	private static void addTableHeader(PdfPTable table)
	{
	    Stream.of("Prduct Name", "Price", "Quantity","Subtotal").forEach(columnTitle -> 
	    {
	    	float[] column_width = new float[] {50f,10f,10f,10f};
	        PdfPCell header = new PdfPCell();
	        header.setHorizontalAlignment(Element.ALIGN_CENTER);
	        header.setBackgroundColor(BaseColor.LIGHT_GRAY);
	        
	        header.setPhrase(new Phrase(columnTitle));
	        table.addCell(header);
	        try 
	        {
				table.setWidths(column_width);
			}
	        catch (DocumentException e) 
	        {
				e.printStackTrace();
			}
	    });
	}
		
	private static void addRows(PdfPTable table)
	{
		OrdersModel order = new OrdersModel().getOrderInformation(orderid);
		CartModel cart = new CartModel().getActiveCartByCartid(order.getCartid());
		ArrayList<CartItemsModel> cartitems = new CartItemsModel().getAllCartItemsByCart(cart.getCartid());
		
		for(CartItemsModel cartitem : cartitems)
		{
			ProductsModel product = new ProductsModel().getProduct(cartitem.getProductid());
			
			Phrase phrase = new Phrase(product.getProductname());
			PdfPCell c1 = new PdfPCell(phrase);
			c1.setHorizontalAlignment(Element.ALIGN_LEFT);
			table.addCell(c1);
			
		    //table.addCell(product.getProductname());
			phrase = new Phrase(String.valueOf(product.getPrice()));
			PdfPCell c2 = new PdfPCell(phrase);
			c2.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table.addCell(c2);
			
			phrase = new Phrase(String.valueOf(cartitem.getQuantity()));
			PdfPCell c3 = new PdfPCell(phrase);
			c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table.addCell(c3);
			
			phrase = new Phrase(String.valueOf(cartitem.getTotal()));
			PdfPCell c4 = new PdfPCell(phrase);
			c4.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table.addCell(c4);
		}
		
		Phrase phrase = new Phrase("Total");
		PdfPCell c1 = new PdfPCell(phrase);
		c1.setColspan(3);
		c1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table.addCell(c1);
		
		phrase = new Phrase(String.valueOf(cart.getSubtotal()));
		c1 = new PdfPCell(phrase);
		c1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table.addCell(c1);
		
	}
}
