package com.example.webshop.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.webshop.domain.Product;
import com.example.webshop.repos.ProductRepo;


@Controller
@RequestMapping("/requests")
public class RequestController {
	@Autowired
	private ProductRepo productRepo;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@GetMapping()
	public String requests(Model model) {
		return "requests";
	}

	@GetMapping(params = "singleModelMaker")
	public String singleModelMaker(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/singleModelMaker.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "avgPCandLaptopPriceByMakersA")
	public String avgPCandLaptopPriceByMakersA(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/avgPCandLaptopPriceByMakersA.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "printersAndGoodPCmakers")
	public String printersAndGoodPCmakers(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/printersAndGoodPCmakers.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "expensiveProducts")
	public String expensiveProducts(Model model) throws IOException {
		var productData = execSQLAndGetProducts("db/requests/expensiveProducts.sql");
		model.addAttribute("products", productData);
		return "requests";
	}

	@GetMapping(params = "goodPCandLaptopMakers")
	public String goodPCandLaptopMakers(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/goodPCandLaptopMakers.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "pcMakersAndQtyNotUnicModels")
	public String pcMakersAndQtyNotUnicModels(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/pcMakersAndQtyNotUnicModels.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "cheapColorPrintersMakers")
	public String cheapColorPrintersMakers(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/cheapColorPrintersMakers.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "pcNotUnicSpeedAndRAM")
	public String pcNotUnicSpeedAndRAM(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/pcNotUnicSpeedAndRAM.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "productsWithPopularHD")
	public String productsWithPopularHD(Model model) throws IOException {
		var productData = execSQLAndGetProducts("db/requests/productsWithPopularHD.sql");
		model.addAttribute("products", productData);
		return "requests";
	}

	@GetMapping(params = "avgSpeedPCByMakerA")
	public String avgSpeedPCByMakerA(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/avgSpeedPCByMakerA.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "makersPCNotLaptop")
	public String makersPCNotLaptop(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/makersPCNotLaptop.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "modelByMakerB")
	public String modelByMakerB(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/modelByMakerB.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "makersLaptopHDMore10")
	public String makersLaptopHDMore10(Model model) throws IOException {
		var productData = execSQLAndGetProducts("db/requests/makersLaptopHDMore10.sql");
		model.addAttribute("products", productData);
		return "requests";
	}

	@GetMapping(params = "pcLess600CD12or24")
	public String pcLess600CD12or24(Model model) throws IOException {
		var labels = List.of("model", "speed", "hd");
		var data = execSQLAndGetData("db/requests/pcLess600CD12or24.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "printersMakers")
	public String printersMakers(Model model) throws IOException {
		List<String> labels = new ArrayList<String>();
		var data = execSQLAndGetData("db/requests/printersMakers.sql", labels);
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "requests";
	}

	@GetMapping(params = "productPCLess500")
	public String productPCLess500(Model model) throws IOException {
		var productData = execSQLAndGetProducts("db/requests/productPCLess500.sql");
		model.addAttribute("products", productData);
		return "requests";
	}

	private List<List<String>> execSQLAndGetData(String path, List<String> labels)
			throws IOException {
		String query = getQueryFromFile(path);
		List<List<String>> dataList = jdbcTemplate.query(query,
				(RowMapper<List<String>>) (rs, rowNum) -> {
					List<String> data = new ArrayList<>();
					if (labels.isEmpty()) {
						ResultSetMetaData rsmd = rs.getMetaData();
						int columns = rsmd.getColumnCount();
						for (int x = 1; x <= columns; x++) {
							labels.add(rsmd.getColumnLabel(x));
						}
					}
					for (String label : labels) {
						data.add(rs.getString(label));
					}
					return data;
				});
		return dataList;
	}

	private Map<Product, String> execSQLAndGetProducts(String path) throws IOException {
		String query = getQueryFromFile(path);
		List<Map.Entry<Product, String>> productDataList = jdbcTemplate.query(query,
				(RowMapper<Entry<Product, String>>) (rs, rowNum) -> {
					Product product = productRepo.findByModel(rs.getString("model"));
					String addData = getCustomeModel(rs);
					return new AbstractMap.SimpleEntry<>(product, addData);
				});
		Map<Product, String> ProductData = productDataList.stream()
				.collect(Collectors.toMap(t -> t.getKey(), t -> t.getValue()));
		return ProductData;
	}

	private String getCustomeModel(ResultSet rs) throws SQLException {
		String model = getColumnValue(rs, "model");
		String maker = getColumnValue(rs, "maker");
		String speed = getColumnValue(rs, "speed");
		String ram = getColumnValue(rs, "ram");
		String hd = getColumnValue(rs, "hd");
		String cd = getColumnValue(rs, "cd");
		String screen = getColumnValue(rs, "screen");
		String price = getColumnValue(rs, "price");
		String printType = getColumnValue(rs, "print_type");
		String color = getColumnValue(rs, "color");
		String type = getColumnValue(rs, "type");
		return (type == null ? "" : type) + (model == null ? "" : model)
				+ (printType == null ? "" : " " + printType)
				+ (color == null ? "" : (color.equals("y") ? " color printer" : " b/w printer"))
				+ (ram == null ? "" : " ram:" + ram) + (speed == null ? "" : " speed:" + speed)
				+ (hd == null ? "" : " hd:" + hd) + (cd == null ? "" : " cd:" + cd)
				+ (screen == null ? "" : " screen:" + screen)
				+ (maker == null ? "" : " by " + maker) + (price == null ? "" : " price:" + price);
	}

	private String getColumnValue(ResultSet rs, String columnName) throws SQLException {
		ResultSetMetaData rsmd = rs.getMetaData();
		boolean hasColumn = false;
		int columns = rsmd.getColumnCount();
		for (int x = 1; x <= columns; x++) {
			if (columnName.equals(rsmd.getColumnName(x))) {
				hasColumn = true;
				break;
			}
		}
		if (hasColumn && rs.getString(columnName) != null) {
			return rs.getString(columnName);
		} else
			return null;
	}

	private String getQueryFromFile(String path) throws FileNotFoundException, IOException {
		Resource resource = new ClassPathResource(path);
		BufferedReader in = new BufferedReader(new FileReader(resource.getFile()));
		LineNumberReader fileReader = new LineNumberReader(in);
		String query = ScriptUtils.readScript(fileReader, ScriptUtils.DEFAULT_COMMENT_PREFIX,
				ScriptUtils.DEFAULT_STATEMENT_SEPARATOR,
				ScriptUtils.DEFAULT_BLOCK_COMMENT_END_DELIMITER);
		return query;
	}
}
