package trg.talentsprint.starterkit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import trg.talentsprint.starterkit.model.Routes;
import trg.talentsprint.starterkit.service.RouteService;

@Controller
public class MapController {
	@Autowired
	private RouteService routeService;
	
	@RequestMapping(value = "/searchinmap", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<Routes> search(Model model, @RequestParam(value = "from", defaultValue = "") String from,
			@RequestParam(value = "to", defaultValue = "") String to) {
		System.out.println(from + " " + to );
		
			List<Routes> routes = routeService.finddaata(from, to);
			
		return routes;
	}

}