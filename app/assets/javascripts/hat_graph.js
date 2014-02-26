var jsonDamages = [{ 
  "hats": [
    {
      "description": "hat",
      "quantity": 2,
      "unit": null,
      "total_cost": 12.0,
      "overcharge?": true,
      "claim_id": 1
    },
    {
      "description": "hat",
      "quantity": 1,
      "unit": null,
      "total_cost": 2.0,
      "overcharge?": false,
      "claim_id": 2
    }],
  "beds": [
    {
      "description": "bed",
      "quantity": 2,
      "unit": null,
      "total_cost": 12.0,
      "overcharge?": false,
      "claim_id": 1
    }
    ]}];

var damage_types = Object.keys(jsonDamages[0]).length;

var bar_width = 10;

var chart = d3.select(".hat_graph").
            append("svg").
            attr("width", bar_width * damage_types);