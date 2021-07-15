import geopandas as gpd, pandas as pd, osmnx as ox

#smaller dataset for testing purposes
#RoadNetwork = ox.graph_from_place('Anthem, Arizona, USA', network_type='drive')

#grab OSM road network only within our custom SHP bounding box
study_area = gpd.read_file('C:/Users/micha/Desktop/studyArea/')
polygon = study_area['geometry'].iloc[0]
RoadNetwork = ox.graph_from_polygon(polygon, network_type='drive', simplify=False)
ox.save_graph_geopackage(RoadNetwork, filepath='C:/Users/micha/Desktop/PHXRoadNetwork.gpkg')

#prepare OSMnx stats for this area
#dictionary for reading the stats
#https://osmnx.readthedocs.io/en/stable/osmnx.html#module-osmnx.stats
stats = ox.basic_stats(RoadNetwork)
data_out = pd.DataFrame(pd.Series(stats, name='value'))
data_out.to_csv(path_or_buf="C:/users/micha/Desktop/PHXRoadNetwork.csv")
