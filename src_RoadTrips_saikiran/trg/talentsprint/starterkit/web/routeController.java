package trg.talentsprint.starterkit.web;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import trg.talentsprint.starterkit.model.Routes;
import trg.talentsprint.starterkit.model.Favourite;
import trg.talentsprint.starterkit.model.Feedback;
import trg.talentsprint.starterkit.model.InterestingPlaces;
import trg.talentsprint.starterkit.service.FavouriteService;
import trg.talentsprint.starterkit.service.FeedbackService;
import trg.talentsprint.starterkit.service.RouteService;

@Controller
public class routeController {
	List<InterestingPlaces> IPlace;

	@Autowired
	private RouteService routeService;

	@Value("${upload.location}")
	private String uploadDirectory;

	@Autowired
	private FavouriteService favourService;

	@Autowired
	private FeedbackService feedbackService;
	
	

	@GetMapping("/StarterKit/")
	public String getHome() {
		return "welcome";

	}
	

	@GetMapping("/routes/{user}")
	public String getAllRoutesbyuser(Model model, @PathVariable("user") String user) {
		model.addAttribute("rlist", routeService.getAllRoutesbyuser(user));
		return "routes";
	}
	
	@GetMapping("/maps")
	public String map() {
		return "search";
		
	}
	@GetMapping("/search")	
	public String getdetailsby(@Valid @ModelAttribute Routes route, BindingResult result, Model model,
			@RequestParam(value = "from", defaultValue = "") String from,
			@RequestParam(value = "to", defaultValue = "") String to,
			@RequestParam(value = "category", defaultValue = "") String category) {
		System.out.println(from);
		System.out.println(to);
		System.out.println(category);
		if (from.equals("") && to.equals("")) {

			return "redirect:/Starterkit/";
		} else {
			List<Routes> routes = routeService.finddaata(from, to);
			model.addAttribute("rlist", routes);

		}
		return "search";

	}

	@GetMapping("/routesById/{id}")
	public String getRouteById(Model model, @PathVariable("id") long id, @ModelAttribute("status") String status) {
		Routes route = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		model.addAttribute("route", route);
		IPlace = routeService.getIplaces(id);
		model.addAttribute("ilist", IPlace);
		model.addAttribute("favourite", new Favourite());
		return "viewdetails";
	}

	@GetMapping("/allroutes")
	public String getallroutes(Model model) {
		model.addAttribute("rlist", routeService.getAllRoutes());
		return "allusers";
	}

	@GetMapping("/update/{id}")
	public String updateroute(Model model, @PathVariable("id") long id) {
		Routes route = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		model.addAttribute("route", route);
		IPlace = routeService.getIplaces(id);
		model.addAttribute("ilist", IPlace);
		return "editroute";
	}

	@PostMapping("/updateroute/{id}")
	public String updatedroute(Model model, @PathVariable("id") long id, @Valid @ModelAttribute Routes route,
			BindingResult result, @RequestParam("file") MultipartFile[] files) {
		if (result.hasErrors()) {
			return "editroute";
		}
		Routes routes = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();
		route.setPath(path);
		routeService.addRoute(route);
		IPlace = routeService.getIplaces(id);
		String user = routes.getUser();
		model.addAttribute("ilist", IPlace);
		model.addAttribute("rlist", routeService.getAllRoutesbyuser(user));
		return "routes";

	}

	@GetMapping("/{id}/delete")
	public String deletestudent(@PathVariable Long id, Model model) {
		Routes routes = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		routeService.deleteById(id);
		routeService.deleteinterstingpbyId(id);
		String user = routes.getUser();
		IPlace = routeService.getIplaces(id);
		model.addAttribute("ilist", IPlace);
		model.addAttribute("rlist", routeService.getAllRoutesbyuser(user));
		return "routes";
	}

	@GetMapping("/new-Route/{user}")
	public String showRouteCreationForm(Model model,
			@PathVariable("user") String user) { /* @RequestParam(value = "user", defaultValue = "") String user) { */
		model.addAttribute("route", new Routes(user));
		IPlace = new ArrayList<InterestingPlaces>();
		return "addRoute";
	}

	@GetMapping("/addInterestingPlaces/{id}")
	public String showaddInterestingPlace(@PathVariable("id") Long id,
			@ModelAttribute("iplace") InterestingPlaces iplace, Model model) {
		model.addAttribute("iplace", new InterestingPlaces());
		iplace.setRid(id);

		model.addAttribute("iplace", iplace);
		return "editaddiplace";
	}

	@GetMapping("/addInterestingPlace/{user}")
	public String addintrestingplaces(@ModelAttribute("route") Routes route, @PathVariable("user") String user,
			Model model, @ModelAttribute("iplace") InterestingPlaces iplace) {
		model.addAttribute("route", route);
		model.addAttribute("iplace", iplace);
		return "addIplace";

	}

	@GetMapping("/updateiplace/{id}")
	public String updateiplace(Model model, @PathVariable("id") int id, @ModelAttribute("route") Routes route) {
		InterestingPlaces iplace = routeService.getIplaceById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		model.addAttribute("iplace", iplace);
		model.addAttribute("route", route);
		IPlace = routeService.getIplaces(id);
		model.addAttribute("ilist", IPlace);
		return "updateiplace";
	}

	@PostMapping("/updateiplace/{id}")
	public String updatediplace(Model model, @ModelAttribute("iplace") InterestingPlaces iplace,
			@PathVariable("id") long rid, @ModelAttribute("route") Routes route,
			@RequestParam("file") MultipartFile[] files) {
		Routes routes = routeService.getRouteById(rid)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + rid));
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();
		iplace.setPath(path);
		iplace.setRid(rid);
		iplace = routeService.addIplace(iplace);
		model.addAttribute("route", routes);
		IPlace = routeService.getIplaces(rid);
		model.addAttribute("ilist", IPlace);
		return "editroute";

	}

	@PostMapping("/addiplacesedit/{id}")
	public String addiplaces(Model model, @ModelAttribute("iplace") InterestingPlaces iplace,
			@PathVariable("id") long rid, @ModelAttribute("route") Routes route,
			@RequestParam("file") MultipartFile[] files) {
		Routes routes = routeService.getRouteById(rid)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + rid));
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("iplace", new InterestingPlaces());
		String path = fileNames.toString();
		iplace.setPath(path);
		iplace.setRid(rid);
		iplace = routeService.addIplace(iplace);
		IPlace = routeService.getIplaces(rid);
		model.addAttribute("ilist", IPlace);
		model.addAttribute("route", routes);
		return "editroute";

	}
	

	@GetMapping("/deleteiplace/{id}")
	public String deleteiplaceID(Model model, @PathVariable("id") int id) {
		InterestingPlaces iplace = routeService.getIplaceById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		long rid = routeService.findroutedetails(id);

		Routes route = routeService.getRouteById(rid)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + rid));
		model.addAttribute("route", route);
		routeService.deleteiplace(id);
		IPlace = routeService.getIplaces(rid);
		model.addAttribute("ilist", IPlace);
		model.addAttribute("route", route);
		return "editroute";
	}

	@RequestMapping(value = "/addInterestingPlace/{user}", method = RequestMethod.POST)
	public String addInterestingPlace(@PathVariable("user") String user, @ModelAttribute("route") Routes route,
			@ModelAttribute("iplace") InterestingPlaces iplace, Model model,
			@RequestParam("file") MultipartFile[] files) {
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();
		iplace.setPath(path);
		route.setUser(user);
		IPlace.add(iplace);		
		return "addRoute";
	}

	@PostMapping("/add")
	public String addRoute(Model model, @ModelAttribute("route") Routes r,
			@RequestParam("file") MultipartFile[] files) {
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();
		r.setPath(path);
		r = routeService.addRoute(r);
		Long rid = r.getId();
		for (InterestingPlaces iplace : IPlace) {
			iplace.setRid(rid);
			routeService.addIplace(iplace);
		}

		return "welcome";
	}

	@PostMapping("/favourite")
	public String addfavourite(@Valid @ModelAttribute Favourite favourite, BindingResult result, Model model,
			RedirectAttributes redattr) {
		if (result.hasErrors()) {
			return "addRoute";
		}
		long rid = favourite.getRid();
		String username = favourite.getUsername();
		boolean status = true;
		Favourite f = favourService.findFavourite(rid, username);
		try {
			long drid = f.getRid();
			String dusername = f.getUsername();

			if (rid == drid && username.equals(dusername)) {
				redattr.addAttribute("rid", rid);
				redattr.addAttribute("status", status);
				return "redirect:/routesById/{rid}";
			}
		} catch (Exception e) {
			favourService.addFavouriteRoute(favourite);
		}
		return "welcome";
	}

	@GetMapping("/rating/{id}")
	public String addrating(@PathVariable("id") long id, Model model,
			@RequestParam(value = "rating", defaultValue = "0") int rating,
			@RequestParam(value = "comment", defaultValue = "0") String comment) {
		routeService.addrating(id, rating, comment);
		return "redirect:/";
	}

	@GetMapping("/blog")
	public String blog() {
		return "Blog";

	}

	@GetMapping("/favourite/{user}")
	public String getMyFavouriteRoute(@PathVariable("user") String name, Model model) {
		model.addAttribute("rlist", routeService.getMyFavouriteRoute(name));
		return "myfavourite";
	}

	@GetMapping("/deleteFavourite/{user}/{id}")
	public String deleteFavourite(@PathVariable("user") String name, Model model, @PathVariable("id") long rid) {
		System.out.println(rid);
		favourService.deleteFavouriteRoute(rid, name);
		return "redirect:/favourite/{user}";
	}

	@GetMapping("/favRouteView/{id}")
	public String getFavRouteView(Model model, @PathVariable("id") long id) {
		Routes route = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		IPlace = routeService.getIplaces(id);
		model.addAttribute("ilist", IPlace);
		model.addAttribute("route", route);
		model.addAttribute("favourite", new Favourite());
		return "fview";
	}
	@GetMapping("/feedbacks")
	public String fedback() {
		return "feedback";
		
	}

	@GetMapping("/feedback")
	public String feedback(@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "feedback", defaultValue = "") String feedback) {
		Feedback f = new Feedback(name, feedback);
		feedbackService.addFeedback(f);
		return "welcome";

	}

}
