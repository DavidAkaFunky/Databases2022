#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask, render_template, request, redirect, url_for
import psycopg2
import psycopg2.extras

## SGBD configs
DB_HOST="db.tecnico.ulisboa.pt"
DB_USER="ist195635"
DB_DATABASE=DB_USER
DB_PASSWORD="tgju3822"
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD)

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

#@app.route("/replenishment_events/")
#def list_replenishment_events():
#    dbConn = None
#    cursor = None
#    try:
#        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
#        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
#        # Devemos pedir ao utilizador o número de série da IVM?
#        query = "SELECT nome, unidades\
#                 FROM evento_reposicao NATURAL JOIN prateleira;"
#        cursor.execute(query)
#        return render_template("replenishment_events.html", cursor=cursor)
#    except Exception as e:
#        return str(e)  # Renders a page with the error.
#    finally:
#        cursor.close()
#        dbConn.close()

@app.route("/new_category/")
def create_category_page():
    return render_template("new_category.html")

@app.route("/new_category/create", methods=["POST"])
def create_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "INSERT INTO categoria_simples VALUES ('%(name)s');" % {'name': request.form['name']}
        cursor.execute(query)
        app.logger.info(query)
        return redirect(url_for("list_replenishment_events"))
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/delete_category/", methods=["DELETE"])
def delete_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "DELETE FROM categoria WHERE nome = %s;"
        name = request.form["nome"]
        data = (name,)
        cursor.execute(query, data)
        return query
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

#@app.route("/new_subcategory/", methods=["POST"])
#def create_category():
#    dbConn = None
#    cursor = None
#    try:
#        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
#        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
#        name = request.form["nome"]
#        super_name = request.form["super_nome"]
#        query = "DELETE FROM categoria_simples\
#                 WHERE nome = '%s'\
#                 AND NOT EXISTS (SELECT *\
#                                 FROM super_categoria\
#                                 WHERE nome = '%s');"
#        data = (super_name, super_name)
#        cursor.execute(query, data)
#        query = "INSERT INTO super_categoria VALUES ('%s')\
#                 WHERE NOT EXISTS (SELECT *\
#                                   FROM super_categoria\
#                                   WHERE nome = '%s');"
#        cursor.execute(query, data)
#        query = "INSERT INTO tem_outra VALUES ('%s', '%s');"
#        data = (super_name, name)
#        cursor.execute(query, data)
#        return redirect(url_for("index"))
#    except Exception as e:
#        return str(e)
#    finally:
#        dbConn.commit()
#        cursor.close()
#        dbConn.close()

#@app.route("/delete_subcategory/", methods=["DELETE"])
#def delete_subcategory():
#    dbConn = None
#    cursor = None
#    try:
#        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
#        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
#        query = "DELETE FROM categoria WHERE nome = %s;"
#        name = request.form["nome"]
#        data = (name,)
#        cursor.execute(query, data)
#        return query
#    except Exception as e:
#        return str(e)
#    finally:
#        dbConn.commit()
#        cursor.close()
#        dbConn.close()

@app.route("/list_replenishment_events/")
def list_replenishment_events():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "SELECT nome, unidades\
                 FROM evento_reposicao NATURAL JOIN prateleira;\
                 WHERE num_serie = %d AND fabricante = '%s';"
        serial_number = request.form["num_serie"]
        manufacturer = request.form["fabricante"]
        data = (serial_number, manufacturer)
        cursor.execute(query, data)
        return render_template("replenishment_events.html", cursor=cursor)
    except Exception as e:
        return str(e)  # Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()

@app.route("/list_subcategories/")
def list_subcategories():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "WITH RECURSIVE sub_categorias AS (\
                     SELECT *\
                     FROM tem_outra\
                     WHERE super_categoria = '%s'\
                 UNION ALL\
                     SELECT *\
                     FROM tem_outra\
                         JOIN sub_categorias ON tem_outra.super_categoria = sub_categorias.categoria\
                 )\
                 SELECT categoria FROM sub_categorias;"
        name = request.form["nome"]
        data = (name,)
        cursor.execute(query, data)
        return render_template("subcategories.html", cursor=cursor, name=name)
    except Exception as e:
        return str(e)  # Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()

CGIHandler().run(app)
